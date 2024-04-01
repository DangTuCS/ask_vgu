import 'package:ask_vgu/data/repository/firestore_repository_impl.dart';
import 'package:ask_vgu/data/repository/graphlit_repository_impl.dart';
import 'package:ask_vgu/domain/firestore_repository.dart';
import 'package:ask_vgu/domain/graphlit_repository.dart';
import 'package:ask_vgu/model/message_model.dart';
import 'package:get/get.dart';

import 'new_conversation_controller.dart';


class NewConversationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GraphlitRepository>(() => GraphlitRepositoryImpl());
    Get.lazyPut<FireStoreRepository>(() => FireStoreRepositoryImpl());
    Get.lazyPut(() => NewConversationController(Get.find(), Get.find()));
  }

  RxList<MessageModel> messages = <MessageModel>[].obs;
}
