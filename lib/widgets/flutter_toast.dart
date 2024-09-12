import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToast {
  static showToast({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.background,
        textColor: AppColors.tertiary,
        fontSize: 20);
  }
}
