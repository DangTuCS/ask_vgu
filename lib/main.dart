import 'package:ask_vgu/main_binding.dart';
import 'package:ask_vgu/route/app_route.dart';
import 'package:ask_vgu/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeUtils.lightTheme,
      darkTheme: ThemeUtils.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppRoute.splash,
      initialBinding: MainBinding(),
      debugShowCheckedModeBanner: false,
      getPages: routes,
    );
  }
}
