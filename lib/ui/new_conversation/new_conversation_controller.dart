import 'package:ask_vgu/domain/firestore_repository.dart';
import 'package:ask_vgu/domain/graphlit_repository.dart';
import 'package:ask_vgu/model/conversantion.dart';
import 'package:ask_vgu/model/message_model.dart';
import 'package:ask_vgu/utils/share_prefs/pref_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'new_conversation_binding.dart';

class NewConversationController extends GetxController {
  final FireStoreRepository _fireStoreRepository;
  final NewConversationBinding binding = NewConversationBinding();

  final GraphlitRepository _repository;

  NewConversationController(this._repository, this._fireStoreRepository);

  String? conversationId;
  final messageController = TextEditingController();
  final scrollController = ScrollController();

  RxBool isLoading = false.obs;
  RxBool isBottom = true.obs;

  String email = '';

  @override
  void onInit() {
    super.onInit();
    conversationId = Get.arguments;
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.minScrollExtent) {
        isBottom.value = true;
      } else {
        isBottom.value = false;
      }
    });
    email = appPrefs.email;
  }

  void firstMessageSending() {
    if (messageController.text.isEmpty) return;
    var messageText = messageController.text;
    messageController.clear();
    var message = MessageModel(
      message: messageText,
      role: Role.USER,
    );
    binding.messages.insert(0, message);
    binding.messages.insert(0, MessageModel(role: Role.ASSISTANT, message: 'Typing...'));
    isLoading.value = true;
    _repository.postMessage(message: messageText, conversationId: null).then((value) {
      binding.messages.removeAt(0);
      isLoading.value = false;
      binding.messages.insert(0, value.$1);
      conversationId = value.$2;
      _fireStoreRepository.addNewConversation(conversation: Conversation(
        id: conversationId!,
        name: messageText,
      ), email: email);
      scrollToLast();
      binding.messages.refresh();
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
    var (newMessage, _) = await _repository.postMessage(message: messageText, conversationId: conversationId!);
    binding.messages.removeAt(0);
    isLoading.value = false;
    binding.messages.insert(0, newMessage);
    scrollToLast();
    binding.messages.refresh();
  }
}
