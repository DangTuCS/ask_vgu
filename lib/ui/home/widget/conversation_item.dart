import 'package:ask_vgu/model/conversantion.dart';
import 'package:ask_vgu/route/app_navigator.dart';
import 'package:ask_vgu/ui/home/widget/edit_name_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ConversationItem extends StatelessWidget {
  final Conversation conversation;
  final Function(String id, String conversationName) editName;
  final Function(String id) deleteConversation;

  const ConversationItem(
      {super.key, required this.conversation, required this.editName, required this.deleteConversation});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              Get.dialog(
                EditNameDialog(conversation: conversation, editName: editName),
              );
            },
            icon: Icons.edit,
            foregroundColor: Theme.of(context).colorScheme.secondary,
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          ),
          SlidableAction(
            onPressed: (context) {
              deleteConversation(conversation.id ?? '');
            },
            icon: Icons.delete,
            foregroundColor: Theme.of(context).colorScheme.error,
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
          ),
        ],
      ),
      child: Container(
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
      ),
    );
  }
}
