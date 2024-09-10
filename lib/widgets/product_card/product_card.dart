import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductCard extends StatefulWidget {
  final String thumbnailUrl, title;
  final num discountPercentage, rating, stock;
  final int productId;
  const ProductCard(
      {super.key,
      required this.thumbnailUrl,
      required this.discountPercentage,
      required this.rating,
      required this.stock,
      required this.title,
      required this.productId});
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  IconData _favoriteIcon = Icons.favorite_border_outlined;
  // add to wishlist function
  Future<void> _favoriteButton({required int productId}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    List<String>? wishList = sharedPreferences.getStringList('wishList');
    sharedPreferences.setStringList('wishList', ['']);
    if (wishList == null) {
      debugPrint('null is called');
      bool successful = await sharedPreferences
          .setStringList('wishList', [productId.toString()]);
      successful
          ? {_showToast(message: 'Item added'), _favoriteIcon = Icons.favorite}
          : _showToast(message: 'Error');
    } else {
      if (wishList.contains(productId.toString())) {
        wishList.remove(productId.toString());
        debugPrint(wishList.toString());
        bool successful =
            await sharedPreferences.setStringList('wishList', wishList);
        successful
            ? {
                _showToast(message: 'Item removed'),
                _favoriteIcon = Icons.favorite_outline
              }
            : _showToast(message: 'Error');
      } else {
        debugPrint('not null is called');
        debugPrint(wishList.toString());
        wishList.add(productId.toString());
        bool successful =
            await sharedPreferences.setStringList('wishList', wishList);
        successful
            ? {
                _showToast(message: 'Item added'),
                _favoriteIcon = Icons.favorite
              }
            : _showToast(message: 'Error');
      }
    }
  }

  void _showToast({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.background,
        textColor: AppColors.tertiary,
        fontSize: 20);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(56, 0, 0, 0),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.network(
                      widget.thumbnailUrl,
                      fit: BoxFit.fitWidth,
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _favoriteButton(productId: 2);
                          });
                        },
                        style: IconButton.styleFrom(
                            padding: const EdgeInsets.all(3),
                            backgroundColor: Colors.white.withOpacity(.8)),
                        icon: Icon(_favoriteIcon,
                            size: 25, color: AppColors.secondary)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, size: 20, color: Colors.yellow[800]),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.rating}',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ]),
      ),
    );
  }
}
