import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApi {
  static Future<Map<String, dynamic>> getAllUserData() async {
    final apiResponse = await http.get(Uri.parse('https://dummyjson.com/user'));
    final Map<String, dynamic> tempHolder = jsonDecode(apiResponse.body);
    return tempHolder;
  }

  static Future<Map<String, dynamic>> getSingleUserData(
      {required int userId}) async {
    final apiResponse =
        await http.get(Uri.parse('https://dummyjson.com/user/$userId'));
    final Map<String, dynamic> tempHolder = jsonDecode(apiResponse.body);
    return tempHolder;
  }
}
