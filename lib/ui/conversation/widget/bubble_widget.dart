import 'package:ask_vgu/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumping_dot/jumping_dot.dart';

class BubbleWidget extends StatelessWidget {
  final bool isLoading;
  final MessageModel? message;

  const BubbleWidget({Key? key, this.message, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 80,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer.withAlpha(100),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
            ),
            child: JumpingDots(
              color: Colors.black,
              radius: 8,
              verticalOffset: -8,
            ),
          ),
        ],
      );
    }
    return Row(
      mainAxisAlignment: message!.role == Role.ASSISTANT ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: message!.role == Role.ASSISTANT
                ? Theme.of(context).colorScheme.secondaryContainer.withAlpha(100)
                : Theme.of(context).colorScheme.tertiaryContainer.withAlpha(100),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: message!.role == Role.ASSISTANT
                  ? Theme.of(context).colorScheme.secondaryContainer
                  : Theme.of(context).colorScheme.tertiaryContainer,
            ),
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          child: Text(
            message!.message ?? '',
            style: Get.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
