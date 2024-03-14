import 'package:ask_vgu/route/app_route.dart';
import 'package:get/get.dart';

class AppNavigators {
  static Future<dynamic>? gotoHome() async {
    return await Get.toNamed(AppRoute.home);
  }

  static Future<dynamic>? gotoConversation({required String? conversationId}) async {
    return await Get.toNamed(AppRoute.conversation, arguments: conversationId);
  }
}