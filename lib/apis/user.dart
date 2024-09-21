import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApi {
  static Future<Map<String, dynamic>> getUserData() async {
    final apiResponse = await http.get(Uri.parse('https://dummyjson.com/user'));
    final Map<String, dynamic> tempHolder = jsonDecode(apiResponse.body);
    return tempHolder;
  }
}
