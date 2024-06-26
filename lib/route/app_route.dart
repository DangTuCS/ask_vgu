import 'package:ask_vgu/ui/conversation/conversation_binding.dart';
import 'package:ask_vgu/ui/conversation/conversation_screen.dart';
import 'package:ask_vgu/ui/documents/documents_binding.dart';
import 'package:ask_vgu/ui/documents/documents_screen.dart';
import 'package:ask_vgu/ui/documents/widget/pdf_view.dart';
import 'package:ask_vgu/ui/home/home_binding.dart';
import 'package:ask_vgu/ui/home/home_screen.dart';
import 'package:ask_vgu/ui/splash/splash_binding.dart';
import 'package:ask_vgu/ui/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String splash = '/';
  static const String home = '/home';
  static const String conversation = '/conversation';
  static const String documentations = '/documentations';
  static const String pdfView = '/pdfView';
}

final routes = [
  GetPage(
    name: AppRoute.splash,
    page: () => const SplashScreen(),
    bindings: [SplashBinding()],
  ),
  GetPage(
    name: AppRoute.home,
    page: () => const HomeScreen(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: AppRoute.conversation,
    page: () => const ConversationScreen(),
    binding: ConversationBinding(),
  ),
  GetPage(
    name: AppRoute.documentations,
    page: () => const DocumentsScreen(),
    binding: DocumentsBinding(),
  ),
  GetPage(
    name: AppRoute.pdfView,
    page: () {
      var path = Get.arguments;
      return PDFScreen(
        path: path as String,
      );
    },
  ),
];
