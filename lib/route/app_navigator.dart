import 'package:ask_vgu/route/app_route.dart';
import 'package:get/get.dart';

class AppNavigators {
  static Future<dynamic>? gotoHome() async {
    return await Get.offAllNamed(AppRoute.home);
  }

  static Future<dynamic>? gotoConversation({required String? conversationId}) async {
    return await Get.toNamed(AppRoute.conversation, arguments: conversationId);
  }

  static Future<dynamic>? gotoDocumentations() async {
    return await Get.toNamed(AppRoute.documentations);
  }

  static Future<dynamic>? gotoPdfView({required String? path}) async {
    return await Get.toNamed(AppRoute.pdfView, arguments: path);
  }

  static Future<dynamic>? gotoLogin() async {
    return await Get.offAllNamed(AppRoute.login);
  }
}