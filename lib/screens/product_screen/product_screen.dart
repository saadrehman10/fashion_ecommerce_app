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
  int _current = 0;
  final CarouselController _controller = CarouselController();
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
        backgroundColor: AppColors.background,
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
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: screenWidth * .9,
                            autoPlay: true,
                            autoPlayAnimationDuration:
                                const Duration(seconds: 2),
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            },
                          ),
                          items: product.imageUrl!.map((imageUrl) {
                            return Container(
                              color: AppColors.background,
                              child: Image.network(
                                imageUrl,
                                loadingBuilder: (BuildContext context,
                                    Widget child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.error,
                                    size: 20,
                                    color: Colors.red,
                                  );
                                },
                              ),
                            );
                          }).toList(),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: product.imageUrl!.map((imageUrl) {
                              int index = product.imageUrl!.indexOf(imageUrl);
                              return GestureDetector(
                                onTap: () {
                                  // Jump to the tapped image in the carousel
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: _current == index
                                          ? AppColors.secondary
                                          : Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    // Thumbnails Row

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  product.category!.capitalize,
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
                          const SizedBox(height: 10),
                          Text(
                            product.title!,
                            style: TextStyle(
                              color: AppColors.tertiary,
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            ProductScreenText.productDetailsTitle,
                            style: TextStyle(
                              color: AppColors.tertiary,
                              fontSize: 22,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            product.description!,
                            style: TextStyle(
                              color: AppColors.textColorSubtitles,
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
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
