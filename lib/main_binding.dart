import 'package:ask_vgu/data/client/graphql_service.dart';
import 'package:ask_vgu/data_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DataController(),permanent: true);
    Get.put(GraphqlService());
  }
}