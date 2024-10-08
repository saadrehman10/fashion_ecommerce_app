import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductApi {
  static Future<Map<String, dynamic>> allProduct() async {
    final jsonResponse =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    if (jsonResponse.statusCode == 200) {
      return json.decode(jsonResponse.body);
    } else {
      throw Exception("Response is not 200");
    }
  }

  static Future<Map<String, dynamic>> singleProduct({int? id}) async {
    final jsonResponse =
        await http.get(Uri.parse('https://dummyjson.com/products/$id'));
    if (jsonResponse.statusCode == 200) {
      return json.decode(jsonResponse.body);
    } else {
      throw Exception("Response is not 200");
    }
  }
}
