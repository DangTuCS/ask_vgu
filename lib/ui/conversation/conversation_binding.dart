import 'package:ask_vgu/data/repository/graphlit_repository_impl.dart';
import 'package:ask_vgu/domain/graphlit_repository.dart';
import 'package:ask_vgu/model/message_model.dart';
import 'package:get/get.dart';

import 'conversation_controller.dart';

class ConversationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GraphlitRepository>(() => GraphlitRepositoryImpl());
    Get.lazyPut(() => ConversationController(Get.find()));
  }

  RxList<MessageModel> messages = <MessageModel>[].obs;
}
