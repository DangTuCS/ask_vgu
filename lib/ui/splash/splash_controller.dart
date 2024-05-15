import 'package:ask_vgu/data_controller.dart';
import 'package:ask_vgu/model/person_model.dart';
import 'package:ask_vgu/route/app_navigator.dart';
import 'package:ask_vgu/utils/share_prefs/pref_utils.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'splash_binding.dart';

class SplashController extends GetxController {
  final SplashBinding binding = SplashBinding();

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData() {
    var credential = GoogleSignIn().currentUser;
    if (appPrefs.email != '' && credential != null) {
      Get.find<DataController>().googleAccount = credential;
      AppNavigators.gotoHome();
    } else {
      AppNavigators.gotoHome();
    }
  }
}
