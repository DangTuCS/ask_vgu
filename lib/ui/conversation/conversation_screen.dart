import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'conversation_controller.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ConversationController>();
    final binding = Get.find<ConversationController>().binding;

    return Container();
  }
}
