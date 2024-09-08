import 'dart:convert';
import 'package:http/http.dart' as http;

class SliderApi {
  static Future<dynamic> sliderData() async {
    final apiResponse = await http
        .get(Uri.parse('https://dummyjson.com/c/31ec-0b2c-4c3d-9194'));
    if (apiResponse.statusCode == 200) {
      return json.decode(apiResponse.body);
    } else {
      throw Exception('Response was not 200');
    }
  }
}
