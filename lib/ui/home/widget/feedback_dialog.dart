import 'package:ask_vgu/domain/firestore_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedBackDialog extends StatefulWidget {
  const FeedBackDialog({super.key});

  @override
  State<FeedBackDialog> createState() => _FeedBackDialogState();
}

class _FeedBackDialogState extends State<FeedBackDialog> {
  final TextEditingController _controller = TextEditingController();

  final FireStoreRepository _fireStoreRepository = Get.find<FireStoreRepository>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Feedback', style: TextStyle(fontSize: 20.0)),
            const SizedBox(height: 16.0),
            const Text(
              'We would love to hear your feedback',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            TextField(
              autofocus: true,
              controller: _controller,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Enter your feedback here',
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _fireStoreRepository.submitFeedback(_controller.text);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
