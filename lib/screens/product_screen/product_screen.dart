import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_ecommerce_app/apis/product_api.dart';
import 'package:flutter/material.dart';
import 'package:fashion_ecommerce_app/utils/formatted_data.dart';

class ProductScreen extends StatefulWidget {
  final int productId;
  const ProductScreen({super.key, required this.productId});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Future<dynamic> _apiProduct;
  Color heartColor = const Color.fromARGB(60, 115, 115, 115);
  void _colorChange() {
    heartColor == Colors.red
        ? heartColor = const Color.fromARGB(60, 115, 115, 115)
        : heartColor = Colors.red;
  }

  @override
  void initState() {
    super.initState;
    _apiProduct = ProductApi.singleProduct(id: widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: _apiProduct,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Loading Product...',
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w100,
                      )),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            Future.delayed(const Duration(seconds: 5), () => setState(() {}));
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Error:\n${snapshot.error}'),
            ));
          } else if (snapshot.hasData) {
            Product product = Product.formJson(snapshot.data!);
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                      options: CarouselOptions(
                        height: screenWidth * 0.8,
                        autoPlay: true,
                        autoPlayAnimationDuration: Durations.long1,
                      ),
                      items: List.generate(product.imageUrl!.length, (index) {
                        return Image.network(product.imageUrl![index],
                            loadingBuilder: (BuildContext context, Widget child,
                                loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        });
                      })),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.title!,
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              r'$ ' + product.price.toString(),
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _colorChange();
                                });
                              },
                              icon: Icon(Icons.favorite,
                                  size: 40, color: heartColor),
                            ),
                          ],
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                          child: Text('Description',
                              style: TextStyle(
                                color: Color.fromRGBO(131, 131, 131, 0.826),
                              )),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(49, 131, 131, 131),
                              borderRadius: BorderRadius.circular(6)),
                          child: Text(product.description!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                        Text(product.rating.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text('NO DATA FOUND'),
              ),
            );
          }
        });
  }
}


