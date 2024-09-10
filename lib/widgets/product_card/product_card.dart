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
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(56, 160, 160, 160),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.network(
                    widget.thumbnailUrl,
                    fit: BoxFit.fitWidth,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4)),
                    padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                    child: Text((widget.discountPercentage).toString() + r' %',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
                child: Text(
                  widget.title!,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.rating.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      )),
                  Row(
                    children: List.generate(
                        5,
                        (index) => const Icon(Icons.star,
                            color: Colors.yellow, size: 20)),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text('Item left : ${widget.stock!}',
                  style: const TextStyle(
                    fontSize: 13,
                  )),
            ]),
      ),
    );
  }
}
