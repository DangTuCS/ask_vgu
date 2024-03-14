import 'package:ask_vgu/route/app_navigator.dart';
import 'package:get/get.dart';

import 'splash_binding.dart';

class SplashController extends GetxController {
  final SplashBinding binding = SplashBinding();

  @override
  void onReady() {
    super.onReady();
    AppNavigators.gotoHome();
  }
}
