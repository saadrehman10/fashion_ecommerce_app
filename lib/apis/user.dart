import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApi {
  static Future<Map<String, dynamic>> getAllUserData() async {
    final apiResponse = await http.get(Uri.parse('https://dummyjson.com/user'));
    if (apiResponse.statusCode == 200) {
      final Map<String, dynamic> tempHolder = jsonDecode(apiResponse.body);
      return tempHolder;
    } else if (apiResponse.statusCode == 404) {
      throw Exception('The response is 404');
    } else {
      throw Exception('The response is not 200');
    }
  }

  static Future<Map<String, dynamic>> getSingleUserData(
      {required int userId}) async {
    final apiResponse =
        await http.get(Uri.parse('https://dummyjson.com/user/$userId'));
    if (apiResponse.statusCode == 200) {
      final Map<String, dynamic> tempHolder = jsonDecode(apiResponse.body);
      return tempHolder;
    } else if (apiResponse.statusCode == 404) {
      throw Exception('The response is 404');
    } else {
      throw Exception('The response is not 200');
    }
  }
}
