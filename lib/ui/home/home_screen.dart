import 'package:ask_vgu/route/app_navigator.dart';
import 'package:ask_vgu/utils/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Obx(() {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Ask VGU'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                AppNavigators.gotoConversation(conversationId: null)?.then((value) {
                  controller.getConversations();
                });
              },
              child: const Icon(Icons.add),
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: const Text('Ask VGU'),
                  ),
                  ListTile(
                    title: const Text('Documents'),
                    onTap: () {
                      AppNavigators.gotoDocumentations();
                    },
                  ),
                  ListTile(
                    title: const Text('Feed back'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Go to website'),
                    onTap: () {
                      launchUrlString('https://vgu.edu.vn',mode: LaunchMode.externalApplication);
                    },
                  ),
                ],
              ),
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
                          color: Theme.of(context).colorScheme.surfaceVariant,
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
