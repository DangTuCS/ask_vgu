import 'package:ask_vgu/data_controller.dart';
import 'package:ask_vgu/domain/firestore_repository.dart';
import 'package:ask_vgu/domain/graphlit_repository.dart';
import 'package:ask_vgu/model/person_model.dart';
import 'package:ask_vgu/route/app_navigator.dart';
import 'package:ask_vgu/utils/share_prefs/pref_utils.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_binding.dart';

class LoginController extends GetxController {
  final GraphlitRepository repository;
  final FireStoreRepository fireStoreRepository;

  LoginController(this.repository, this.fireStoreRepository);

  final LoginBinding binding = LoginBinding();

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );
  final DataController dataController = Get.find();

  void login() async {
    googleSignIn.signOut();
    var credential = await googleSignIn.signIn();
    if (credential != null) {
      Get.snackbar('Login', 'Success');
      dataController.googleAccount = credential;
      appPrefs.email = credential.email;
      var user = await fireStoreRepository.getPerson(credential.email);
      if (user == null) {
        var temp = PersonModel(
          id: credential.id,
          email: credential.email,
          name: credential.displayName,
          conversations: [],
        );
        await fireStoreRepository.addPerson(temp);
        dataController.user = temp;
      } else {
        dataController.user = user;
      }
      AppNavigators.gotoHome();
    } else {
      Get.snackbar('Login', 'Failed');
    }
  }
}
