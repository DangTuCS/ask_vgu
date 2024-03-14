import 'package:ask_vgu/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppAssets.vguLogo),
      ),
    );
  }
}
