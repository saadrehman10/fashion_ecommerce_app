import 'package:fashion_ecommerce_app/apis/user.dart';
import 'package:fashion_ecommerce_app/models/user.dart';
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

class LoginValidation {
  Future<bool> validateUser(
      {required String email, required String password}) async {
    final Map<String, dynamic> apiData = await UserApi.getUserData();
    final List<User> userValidationData = List<User>.generate(apiData['limit'],
        (index) => User.onlyIdAndPassFromJson(apiData['users'][index]));
    for (var user in userValidationData) {
      if (user.email == email && user.password == password) {
        await LoginStatusLogic.setLoginStatus(true);
        return true;
      }
    }
    await LoginStatusLogic.setLoginStatus(false);
    return false;
  }
}
