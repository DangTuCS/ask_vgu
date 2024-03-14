import 'package:ask_vgu/route/app_navigator.dart';
import 'package:ask_vgu/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Obx(() {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Ask VGU'),
              automaticallyImplyLeading: false,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (ctx, index) {
                      var conversation = controller.binding.conversations[index];
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        child: ListTile(
                          title: Text(conversation.name ?? ''),
                          onTap: () {
                            AppNavigators.gotoConversation(conversationId: conversation.id);
                          },
                        ),
                      );
                    },
                    itemCount: controller.binding.conversations.length,
                  ),
                ),
              ],
            ));
      }),
    );
  }
}
