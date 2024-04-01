import 'package:ask_vgu/data/repository/firestore_repository_impl.dart';
import 'package:ask_vgu/data/repository/graphlit_repository_impl.dart';
import 'package:ask_vgu/domain/firestore_repository.dart';
import 'package:ask_vgu/domain/graphlit_repository.dart';
import 'package:ask_vgu/model/conversantion.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GraphlitRepository>(() => GraphlitRepositoryImpl());
    Get.lazyPut<FireStoreRepository>(() => FireStoreRepositoryImpl());
    Get.lazyPut(() => HomeController(Get.find(), Get.find()));
  }

  RxList<Conversation> conversations = <Conversation>[].obs;
}
