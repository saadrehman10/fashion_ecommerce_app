import 'package:shared_preferences/shared_preferences.dart';

class WishListLogic {
  static Future<void> createWishlist() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setStringList('wishList', []);
  }

  static Future<List<String>> getWishlist() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final List<String>? myWishlistData = sp.getStringList('myCart');
    if (myWishlistData == null) {
      await createWishlist();
      final List<String> temp = sp.getStringList('myCart')!;
      return temp;
    } else {
      return myWishlistData;
    }
  }

  static Future<bool> addToWishlist({required int productId}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final List<String>? myCartData = sp.getStringList('myCart');
    try {
      if (myCartData == null) {
        await createWishlist();
        final List<String> temp = sp.getStringList('myCart')!;
        temp.add(productId.toString());
        sp.setStringList('myCart', temp);
        return true;
      } else if (myCartData.contains(productId.toString())) {
        return false;
      } else {
        myCartData.add(productId.toString());
        sp.setStringList('myCart', myCartData);
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deleteMyCart({required int productId}) async {
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
