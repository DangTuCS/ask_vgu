import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static final _instance = Get.find<SharedPreferences>();

  static Future<dynamic> init() async {
    await Get.putAsync<SharedPreferences>(() => SharedPreferences.getInstance(), permanent: true);
  }

  String get email => _instance.getString('email') ?? '';

  set email(String email) {
    _instance.setString('email', email);
  }

  void clean() {
    _instance.clear();
  }
}

PrefUtils appPrefs = PrefUtils();