import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/flutter_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishListLogic {
  static Future<bool> favoriteButton({required int productId}) async {
    bool iconState = false;
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    List<String>? wishList = sharedPreferences.getStringList('wishList');
    if (wishList == null) {
      bool successful = await sharedPreferences
          .setStringList('wishList', [productId.toString()]);
      successful
          ? {
              FlutterToast.showToast(message: ToastMessages.addItem),
              iconState = true,
            }
          : FlutterToast.showToast(message: ToastMessages.error);
    } else {
      if (wishList.contains(productId.toString())) {
        wishList.remove(productId.toString());

        bool successful =
            await sharedPreferences.setStringList('wishList', wishList);
        successful
            ? {
                FlutterToast.showToast(message: ToastMessages.removedItem),
                iconState = false,
              }
            : FlutterToast.showToast(message: ToastMessages.error);
      } else {
        wishList.add(productId.toString());
        bool successful =
            await sharedPreferences.setStringList('wishList', wishList);
        successful
            ? {
                FlutterToast.showToast(message: ToastMessages.addItem),
                iconState = true,
              }
            : FlutterToast.showToast(message: ToastMessages.error);
      }
    }
    return iconState;
  }
}
