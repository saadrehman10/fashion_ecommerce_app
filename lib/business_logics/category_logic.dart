import 'package:fashion_ecommerce_app/apis/product_api.dart';

class CategoryLogic {
  static Future<dynamic> getCategoryData({required String category}) async {
    Map<String, dynamic> allProduct = await ProductApi.allProduct();
    allProduct['products'].removeWhere((element) {
      return element['category'] != category;
    });
    return allProduct;
  }
}
