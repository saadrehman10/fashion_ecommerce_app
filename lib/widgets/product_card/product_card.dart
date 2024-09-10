import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String thumbnailUrl, title;
  final num discountPercentage, rating, stock;
  const ProductCard(
      {super.key,
      required this.thumbnailUrl,
      required this.discountPercentage,
      required this.rating,
      required this.stock,
      required this.title});
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(56, 0, 0, 0),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Expanded(
                    child: Image.network(
                      widget.thumbnailUrl,
                      fit: BoxFit.fitWidth,
                    ),
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
              Text(
                widget.title,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
            ]),
      ),
    );
  }
}
