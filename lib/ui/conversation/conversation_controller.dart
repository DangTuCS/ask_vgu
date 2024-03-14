import 'package:get/get.dart';

import 'conversation_binding.dart';

class ConversationController extends GetxController {
  final ConversationBinding binding = ConversationBinding();

  String? conversationId;

  @override
  void onInit() {
    super.onInit();
    conversationId = Get.arguments;
  }
}
