import 'package:shared_preferences/shared_preferences.dart';

class WishListLogic {
  static Future<void> createWishlist() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setStringList('wishList', []);
  }

  static Future<List<String>> getWishlist() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final List<String>? wishlistData = sp.getStringList('wishList');
    if (wishlistData == null) {
      await createWishlist();
      final List<String> temp = sp.getStringList('wishList')!;
      return temp;
    } else {
      return wishlistData;
    }
  }

  static Future<bool> addToWishlist({required int productId}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final List<String>? wishListData = sp.getStringList('wishList');
    try {
      if (wishListData == null) {
        await createWishlist();
        final List<String> temp = sp.getStringList('wishList')!;
        temp.add(productId.toString());
        sp.setStringList('wishList', temp);
        return true;
      } else if (wishListData.contains(productId.toString())) {
        return false;
      } else {
        wishListData.add(productId.toString());
        sp.setStringList('wishList', wishListData);
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deleteWishList({required int productId}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final List<String>? wishListData = sp.getStringList('wishList');
    try {
      if (wishListData == null) {
        return false;
      } else {
        wishListData.remove(productId.toString());
        sp.setStringList('wishList', wishListData);
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
