import 'package:fashion_ecommerce_app/apis/product_api.dart';

class CategoryLogic {
  static Future<Map<String, dynamic>> getCategoryData(
      {required String category}) async {
    Map<String, dynamic> allProduct = await ProductApi.allProduct();
    allProduct['products'].removeWhere((element) {
      element['category'] != category;
      allProduct['limit']--;
    });
    return allProduct;
  }
}
