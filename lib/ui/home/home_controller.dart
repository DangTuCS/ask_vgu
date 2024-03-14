import 'package:ask_vgu/domain/graphlit_repository.dart';
import 'package:get/get.dart';

import 'home_binding.dart';

class HomeController extends GetxController {
  final GraphlitRepository repository;
  HomeController(this.repository);

  final HomeBinding binding = HomeBinding();

  Future<void> postMessage() async {
    await repository.postMessage(message: '');
  }

  Future<void> getConversations() async {
    binding.conversations.value = await repository.getConversations();
    binding.conversations.refresh();
  }

  @override
  void onInit() {
    super.onInit();
    getConversations();
  }
}
