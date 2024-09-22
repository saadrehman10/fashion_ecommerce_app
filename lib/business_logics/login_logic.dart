import 'dart:convert';

import 'package:fashion_ecommerce_app/apis/user_api.dart';
import 'package:fashion_ecommerce_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginStatusLogic {
  static Future<void> setLoginStatus(bool value, [String? userData]) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('loginStatus', value);
    sp.setString('LoggedInUserData', userData ?? '');
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
  static Future<bool> validateUserViaEmail(
      {required String email, required String password}) async {
    final Map<String, dynamic> apiData = await UserApi.getAllUserData();

    final List<User> userValidationData = List<User>.generate(apiData['limit'],
        (index) => User.onlyIdAndPassFromJson(apiData['users'][index]));

    for (int i = 0; i < userValidationData.length; i++) {
      User user = userValidationData[i];
      if (user.email == email && user.password == password) {
        final String jsonEncodedData = jsonEncode(apiData['users'][i]);
        await LoginStatusLogic.setLoginStatus(true, jsonEncodedData);
        return true;
      }
    }
    await LoginStatusLogic.setLoginStatus(false);
    return false;
  }

  static Future<bool> validateUserViaUserName(
      {required String userName, required String password}) async {
    final Map<String, dynamic>? apiData = await UserApi.authenticateUserLogin(
        userName: userName, password: password);
    debugPrint(apiData.toString());
    if (apiData != null) {
      final String jsonEncodedData = jsonEncode(apiData);
      LoginStatusLogic.setLoginStatus(true, jsonEncodedData);
      return true;
    } else {
      return false;
    }
  }
}
