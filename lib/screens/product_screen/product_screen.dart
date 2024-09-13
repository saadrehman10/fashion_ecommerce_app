import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_ecommerce_app/apis/product_api.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
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
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ProductScreenText.pageTitle,
          style: TextStyle(
            color: AppColors.tertiary,
            fontSize: 21,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                  padding: const EdgeInsets.all(3),
                  backgroundColor: Colors.white.withOpacity(.8)),
              icon: Icon(Icons.favorite, size: 25, color: AppColors.secondary)),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
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
              return Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Error:\n${snapshot.error}'),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _apiProduct =
                              ProductApi.singleProduct(id: widget.productId);
                        });
                      },
                      icon: Icon(Icons.refresh,
                          size: 20, color: AppColors.secondary),
                    ),
                  ],
                ),
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
                          return Image.network(
                            product.imageUrl![index],
                            loadingBuilder: (BuildContext context, Widget child,
                                loadingProgress) {
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
                          );
                        })),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  product.category!,
                                  style: TextStyle(
                                    color: AppColors.textColorSubtitles,
                                    fontSize: 20,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        size: 25, color: Colors.yellow[700]),
                                    const SizedBox(width: 10),
                                    Text(
                                      product.rating!.toString(),
                                      style: TextStyle(
                                        color: AppColors.textColorSubtitles,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
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
          },
        ),
      ),
    );
  }
}
