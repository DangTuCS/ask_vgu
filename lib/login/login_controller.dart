import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_binding.dart';

class LoginController extends GetxController {
  final LoginBinding binding = LoginBinding();

  final GoogleSignIn googleSignIn = GoogleSignIn(
    // The OAuth client id of your app. This is required.
    clientId: 'Your Client ID',
    // If you need to authenticate to a backend server, specify its OAuth client. This is optional.
    serverClientId: 'Your Server ID',
  );

  void login() {}
}
