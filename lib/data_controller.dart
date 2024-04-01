import 'package:ask_vgu/model/person_model.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DataController extends SuperController {
  GoogleSignInAccount? googleAccount;
  PersonModel? user;

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

}