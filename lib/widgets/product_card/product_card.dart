import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductCard extends StatefulWidget {
  final String thumbnailUrl, title;
  final num rating, price;
  final int productId;
  const ProductCard(
      {super.key,
      required this.thumbnailUrl,
      required this.rating,
      required this.title,
      required this.productId,
      required this.price});
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  IconData _favoriteIcon = Icons.favorite_border_outlined;

  // Future<void> _favIcon() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   List<String>? wishList = sharedPreferences.getStringList('wishList');
  //   if (wishList != null && wishList.contains(widget.productId.toString())) {
  //     setState(() {
  //       _favoriteIcon = Icons.favorite;
  //     });
  //   }
  // }

  // add to wishlist function
  Future<void> _favoriteButton({required int productId}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    List<String>? wishList = sharedPreferences.getStringList('wishList');
    if (wishList == null) {
      bool successful = await sharedPreferences
          .setStringList('wishList', [productId.toString()]);
      successful
          ? {
              _showToast(message: 'Item added'),
              _favoriteIcon = Icons.favorite,
              setState(() {}),
            }
          : _showToast(message: 'Error');
    } else {
      if (wishList.contains(productId.toString())) {
        wishList.remove(productId.toString());

        bool successful =
            await sharedPreferences.setStringList('wishList', wishList);
        successful
            ? {
                _showToast(message: 'Item removed'),
                _favoriteIcon = Icons.favorite_outline,
                setState(() {}),
              }
            : _showToast(message: 'Error');
      } else {
        wishList.add(productId.toString());
        bool successful =
            await sharedPreferences.setStringList('wishList', wishList);
        successful
            ? {
                _showToast(message: 'Item added'),
                _favoriteIcon = Icons.favorite,
                setState(() {}),
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

  // @override
  // void initState() {
  //   super.initState;
  //   _favIcon();
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(3),
        height: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Center(
                        child: Image.network(
                          widget.thumbnailUrl,
                          loadingBuilder: (context, child, loadingProgress) {
                            return const CircularProgressIndicator();
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error,
                                size: 20, color: AppColors.textColorSubtitles);
                          },
                          // fit: BoxFit.fitWidth,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            _favoriteButton(productId: widget.productId);
                          },
                          style: IconButton.styleFrom(
                              padding: const EdgeInsets.all(3),
                              backgroundColor: Colors.white.withOpacity(.8)),
                          icon: Icon(_favoriteIcon,
                              size: 25, color: AppColors.secondary)),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    height: 30,
                    child: Text(
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
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
              const SizedBox(height: 10),
              Text(
                '\$${widget.price.toString()}',
                style: TextStyle(
                  color: AppColors.tertiary,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ]),
      ),
    );
  }
}
