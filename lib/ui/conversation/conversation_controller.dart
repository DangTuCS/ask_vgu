import 'package:ask_vgu/domain/graphlit_repository.dart';
import 'package:ask_vgu/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'conversation_binding.dart';

class ConversationController extends GetxController {
  final ConversationBinding binding = ConversationBinding();

  final GraphlitRepository _repository;

  ConversationController(this._repository);

  String? conversationId;
  final messageController = TextEditingController();
  final scrollController = ScrollController();

  RxBool isLoading = false.obs;

  RxBool isBottom = true.obs;

  @override
  void onInit() {
    super.onInit();
    conversationId = Get.arguments;
    getMessages();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.minScrollExtent) {
        isBottom.value = true;
      } else {
        isBottom.value = false;
      }
    });
  }

  void scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    scrollController.jumpTo(scrollController.position.minScrollExtent);
  }

  @override
  onClose() {
    messageController.dispose();
    super.onClose();
  }

  Future<void> getMessages() async {
    var result = await _repository.getMessages(conversationId: conversationId!);
    binding.messages.assignAll(result.reversed);
    binding.messages.refresh();
    await Future.delayed(const Duration(milliseconds: 100));
    scrollToBottom();
  }

  Future<void> scrollToLast() async {
    await Future.delayed(const Duration(milliseconds: 100));
    Scrollable.ensureVisible(
      GlobalObjectKey(binding.messages.length - 1).currentContext!,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  void hideKeyboard() {
    FocusScope.of(Get.context!).unfocus();
  }

  void sendMessage() async {
    if (messageController.text.isEmpty) return;
    var messageText = messageController.text;
    messageController.clear();
    scrollToBottom();
    var message = MessageModel(
      message: messageText,
      role: Role.USER,
    );
    binding.messages.insert(0, message);
    hideKeyboard();
    binding.messages.insert(0, MessageModel(role: Role.ASSISTANT, message: 'Typing...'));
    isLoading.value = true;
    var newMessage = await _repository.postMessage(message: messageText, conversationId: conversationId!);
    binding.messages.removeAt(0);
    isLoading.value = false;
    binding.messages.insert(0, newMessage);
    scrollToLast();
    binding.messages.refresh();
  }
}
