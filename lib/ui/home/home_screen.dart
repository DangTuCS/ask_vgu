import 'package:ask_vgu/route/app_navigator.dart';
import 'package:ask_vgu/ui/home/widget/conversation_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
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
              actions: [
                InkWell(
                  onTap: () {
                    controller.logout();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: CircleAvatar(
                      backgroundImage:
                          CachedNetworkImageProvider(controller.dataController.googleAccount?.photoUrl ?? ''),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                AppNavigators.gotoNewConversations();
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
                      launchUrlString('https://vgu.edu.vn', mode: LaunchMode.externalApplication);
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
                      return ConversationItem(
                        conversation: conversation,
                        editName: controller.editName,
                        deleteConversation: controller.deleteConversation,
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
