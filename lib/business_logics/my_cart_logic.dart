import 'package:shared_preferences/shared_preferences.dart';

class MyCart {
  Future<void> createMyCart() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setStringList('myCart', []);
  }

  Future<List<String>> getCartData() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final List<String>? myCartData = sp.getStringList('myCart');
    if (myCartData == null) {
      await createMyCart();
      final List<String> temp = sp.getStringList('myCart')!;
      return temp;
    } else {
      return myCartData;
    }
  }

  Future<bool> addToMyCart({required int productId}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final List<String>? myCartData = sp.getStringList('myCart');
    try {
      if (myCartData == null) {
        await createMyCart();
        final List<String> temp = sp.getStringList('myCart')!;
        temp.add(productId.toString());
        sp.setStringList('myCart', temp);
        return true;
      } else {
        myCartData.add(productId.toString());
        sp.setStringList('myCart', myCartData);
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteMyCart({required int productId}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final List<String>? myCartData = sp.getStringList('myCart');
    try {
      if (myCartData == null) {
        return false;
      } else {
        myCartData.remove(productId.toString());
        sp.setStringList('myCart', myCartData);
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
