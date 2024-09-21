import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppOpenLogic {
  static Future<void> setAppStatus(bool value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('firstOpen', value);
  }

  static Future<bool> checkAppStatus() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? appStatue = sp.getBool('firstOpen');
    if (appStatue == null) {
      await setAppStatus(true);
      return true;
    } else {
      debugPrint(appStatue.toString());
      return appStatue;
    }
  }
}
