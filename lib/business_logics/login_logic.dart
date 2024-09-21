import 'package:shared_preferences/shared_preferences.dart';

class LoginStatusLogic {
  static Future<void> setLoginStatus(bool value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('loginStatus', value);
  }

  static Future<bool> getLoginStatus() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? loginStatus = sp.getBool('loginStatus');
    if (loginStatus == null) {
      await setLoginStatus(false);
      return false;
    } else {
      return loginStatus;
    }
  }
}

class LoginValidation extends LoginStatusLogic {
   
}
