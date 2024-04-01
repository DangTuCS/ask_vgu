import 'package:ask_vgu/data/repository/firestore_repository_impl.dart';
import 'package:ask_vgu/data/repository/graphlit_repository_impl.dart';
import 'package:ask_vgu/domain/firestore_repository.dart';
import 'package:ask_vgu/domain/graphlit_repository.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GraphlitRepository>(() => GraphlitRepositoryImpl());
    Get.lazyPut<FireStoreRepository>(() => FireStoreRepositoryImpl());
    Get.lazyPut(() => LoginController(Get.find(), Get.find()));
  }
}
