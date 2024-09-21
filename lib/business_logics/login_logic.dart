import 'package:shared_preferences/shared_preferences.dart';

class LoginLogic {
  static Future<void> setLoginStatus(bool value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('loginStatus', value);
  }
}
