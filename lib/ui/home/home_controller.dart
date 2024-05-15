import 'package:ask_vgu/data_controller.dart';
import 'package:ask_vgu/domain/firestore_repository.dart';
import 'package:ask_vgu/domain/graphlit_repository.dart';
import 'package:ask_vgu/utils/share_prefs/pref_utils.dart';
import 'package:get/get.dart';

import 'home_binding.dart';

class HomeController extends GetxController {
  final GraphlitRepository repository;
  final FireStoreRepository fireStoreRepository ;
  HomeController(this.repository,this.fireStoreRepository);

  final HomeBinding binding = HomeBinding();
  final DataController dataController = Get.find();

  Future<void> postMessage() async {
    await repository.postMessage(message: '');
  }

  Future<void> getConversations() async {
    binding.conversations.value = await fireStoreRepository.getConversations(
      appPrefs.email,
    );
    binding.conversations.refresh();
  }

  @override
  void onInit() {
    super.onInit();
    getConversations();
  }

  void logout() {
    dataController.googleAccount = null;
    dataController.user = null;
    appPrefs.clean();
    Get.offAllNamed('/login');
  }

  void deleteConversation(String? conversationId) async {
    await repository.deleteConversation(conversationId);
    await fireStoreRepository.deleteConversation(conversationId ?? '');
    getConversations();
  }

  void editName(String? id, String s) {
    fireStoreRepository.editConversationName(id ?? '', s).then((value) => getConversations());
  }
}
