import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  Future<void> _favrouitButton({required int productId}) async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    List<String>? _wishList = _sharedPreferences.getStringList('wishList');
    if (_wishList == null) {
      bool successful = await _sharedPreferences
          .setStringList('wishList', [productId.toString()]);
      if (successful) {
        
      }
    } else {}
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
                        onPressed: () {},
                        style: IconButton.styleFrom(
                            padding: const EdgeInsets.all(3),
                            backgroundColor: Colors.white.withOpacity(.8)),
                        icon: Icon(Icons.favorite_border,
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
