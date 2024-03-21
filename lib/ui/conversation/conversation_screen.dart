import 'package:ask_vgu/model/message_model.dart';
import 'package:ask_vgu/ui/conversation/widget/bubble_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'conversation_controller.dart';

class ConversationScreen extends GetView<ConversationController> {
  const ConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Ask VGU', style: TextStyle(color: Theme.of(context).colorScheme.tertiary)),
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Obx(() {
                      if (controller.binding.messages.isEmpty) {
                        return const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return Expanded(
                        child: ListView.separated(
                            reverse: true,
                            controller: controller.scrollController,
                            padding: EdgeInsets.zero,
                            itemBuilder: (ctx, index) {
                              var message = controller.binding.messages[index];
                              var isLast = index == controller.binding.messages.length - 1;
                              return Container(
                                key: GlobalObjectKey(index),
                                child: BubbleWidget(
                                  message: message,
                                  isLoading: isLast && controller.isLoading.value,
                                ),
                              );
                            },
                            itemCount: controller.binding.messages.length,
                            separatorBuilder: (BuildContext context, int index) {
                              return const Gap(12);
                            }),
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, left: 2.0, top: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 58,
                              child: TextField(
                                  scrollPadding:
                                      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 16 * 4),
                                  controller: controller.messageController,
                                  decoration: const InputDecoration(
                                    hintText: 'Type a message',
                                  ),
                                  onSubmitted: (value) {
                                    controller.sendMessage();
                                  }),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.sendMessage();
                            },
                            icon: const Icon(Icons.send),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() {
                if (controller.isBottom.value == false) {
                  return Positioned(
                    bottom: 100,
                    right: 16,
                    left: 16,
                    child: GestureDetector(
                      onTap: () {
                        controller.scrollToBottom();
                      },
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                        radius: 24,
                        child: const Icon(
                          Icons.arrow_downward_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
