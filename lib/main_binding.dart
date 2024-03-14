import 'package:ask_vgu/data/client/graphql_service.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GraphqlService());
  }
}