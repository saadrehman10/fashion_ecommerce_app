import 'package:fashion_ecommerce_app/business_logics/wishlist_logic.dart';
import 'package:fashion_ecommerce_app/screens/product_screen/product_screen.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/flutter_toast.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String thumbnailUrl, title;
  final num rating, price;
  final int productId;
  final Function? onPressIconButton;
  const ProductCard({
    super.key,
    required this.thumbnailUrl,
    required this.rating,
    required this.title,
    required this.productId,
    required this.price,
    this.onPressIconButton,
  });
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late IconData _favoriteIcon;
  bool _isLoading = false;

  // add to wishlist function
  Future<void> _favoriteButton({required int productId}) async {
    List<String> data = await WishListLogic.getWishlist();
    if (data.contains(widget.productId.toString())) {
      bool temp =
          await WishListLogic.deleteWishList(productId: widget.productId);
      setState(() {
        _iconColor();
      });
      temp
          ? FlutterToast.showToast(message: ToastMessages.removedItemWishList)
          : FlutterToast.showToast(message: ToastMessages.error);
    } else {
      bool temp =
          await WishListLogic.addToWishlist(productId: widget.productId);
      setState(() {
        _iconColor();
      });
      temp
          ? FlutterToast.showToast(message: ToastMessages.addItemWishList)
          : FlutterToast.showToast(message: ToastMessages.error);
    }
  }

  Future<void> _iconColor() async {
    List<String> temp = await WishListLogic.getWishlist();
    if (temp.contains(widget.productId.toString())) {
      setState(() {
        _favoriteIcon = Icons.favorite;
        _isLoading = true;
      });
    } else {
      setState(() {
        _favoriteIcon = Icons.favorite_outline;
        _isLoading = true;
      });
    }
  }

  @override
  void initState() {
    super.initState;
    _iconColor();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductScreen(
                            productId: widget.productId,
                          )));
            },
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
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.error,
                                      size: 20,
                                      color: AppColors.textColorSubtitles);
                                },
                                // fit: BoxFit.fitWidth,
                              ),
                            ),
                            IconButton(
                                onPressed: () async {
                                  await _favoriteButton(
                                      productId: widget.productId);
                                  widget.onPressIconButton?.call();
                                },
                                style: IconButton.styleFrom(
                                    padding: const EdgeInsets.all(3),
                                    backgroundColor:
                                        Colors.white.withOpacity(.8)),
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
                            Icon(Icons.star,
                                size: 20, color: Colors.yellow[800]),
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
          )
        : const Text('');
  }
}
