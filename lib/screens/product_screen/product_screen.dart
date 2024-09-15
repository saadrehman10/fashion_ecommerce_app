import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_ecommerce_app/apis/data.dart';
import 'package:fashion_ecommerce_app/apis/product_api.dart';
import 'package:fashion_ecommerce_app/business_logics/my_cart_logic.dart';
import 'package:fashion_ecommerce_app/business_logics/wishlist_logic.dart';
import 'package:fashion_ecommerce_app/models/product.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductScreen extends StatefulWidget {
  final int productId;

  const ProductScreen({super.key, required this.productId});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _current = 0;
  int _currentSizeIndex = 0;
  int _currentColorIndex = 0;
  // final CarouselController _controller = CarouselController();
  late Future<dynamic> _apiProduct;
  late IconData _favoriteIcon;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState;
    _apiProduct = ProductApi.singleProduct(id: widget.productId);
    _iconColor();
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
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
        actions: _isLoading
            ? [
                IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                        padding: const EdgeInsets.all(3),
                        backgroundColor: Colors.white.withOpacity(.8)),
                    icon: Icon(_favoriteIcon,
                        size: 25, color: AppColors.secondary)),
              ]
            : null,
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
                                  return Icon(
                                    Icons.error,
                                    size: 20,
                                    color: AppColors.textColorSubtitles,
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
                          padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
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
                                    color: AppColors.background,
                                    border: Border.all(
                                      color: _current == index
                                          ? AppColors.secondary
                                          : AppColors.background,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) => Icon(
                                            Icons.error,
                                            size: 10,
                                            color:
                                                AppColors.textColorSubtitles),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
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
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.grey.withOpacity(.50),
                                width: screenWidth * .85,
                                height: 1,
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            ProductScreenText.sizeTitle,
                            style: TextStyle(
                              color: AppColors.tertiary,
                              fontSize: 22,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productSizes.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 8),
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _currentSizeIndex = index;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 3,
                                        ),
                                        backgroundColor:
                                            _currentSizeIndex == index
                                                ? AppColors.secondary
                                                : null,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        side: const BorderSide(
                                          color: Colors.grey,
                                          width: .5,
                                        )),
                                    child: Text(
                                      productSizes[index],
                                      style: TextStyle(
                                        color: _currentSizeIndex == index
                                            ? AppColors.primary
                                            : AppColors.tertiary,
                                        fontSize: 16,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            ProductScreenText.sizeColor,
                            style: TextStyle(
                              color: AppColors.tertiary,
                              fontSize: 22,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productColors.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _currentColorIndex = productColors.indexOf(
                                      productColors[index],
                                    );
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: CircleAvatar(
                                      backgroundColor: productColors[index],
                                      radius: 15,
                                      child: _currentColorIndex ==
                                              productColors.indexOf(
                                                productColors[index],
                                              )
                                          ? const CircleAvatar(
                                              radius: 7,
                                              backgroundColor: Colors.white,
                                            )
                                          : null),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(
                                0, 2), // Shadow below the container
                            blurRadius: 8,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset:
                                const Offset(0, -2), // Shadow on the top part
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(ProductScreenText.totalPrice,
                                  style: TextStyle(
                                    color: AppColors.textColorSubtitles,
                                    fontSize: 17,
                                  )),
                              Text('\$${product.price}',
                                  style: TextStyle(
                                    color: AppColors.tertiary,
                                    fontSize: 22,
                                  )),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                bool temp = await MyCart.addToMyCart(
                                    productId: product.id);

                                temp
                                    ? FlutterToast.showToast(
                                        message: ToastMessages.addItemCart)
                                    : FlutterToast.showToast(
                                        message: ToastMessages.itemExistCart);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondary,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 40),
                                shadowColor: Colors.black,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(FontAwesomeIcons.bagShopping,
                                      size: 20, color: AppColors.primary),
                                  const SizedBox(width: 10),
                                  Text(ButtonText.addToCart,
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 20,
                                      )),
                                ],
                              ))
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
