import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AppColors {
  // static String? _theme;
  // static void _saveThemeMode() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('Theme', 'light');
  //   _theme = prefs.getString('Theme');
  // }

  static Color get primary => const Color(0xFFFFFFFF);
  static Color get secondary => const Color(0xFF704F38);
  static Color get tertiary => const Color(0xFF282932);
  static Color get background => const Color.fromARGB(255, 238, 228, 219);
  static Color get textColorSubtitles =>
      const Color.fromARGB(155, 113, 113, 113);
}
