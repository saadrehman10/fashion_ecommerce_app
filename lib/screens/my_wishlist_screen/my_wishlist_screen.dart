import 'package:fashion_ecommerce_app/apis/product_api.dart';
import 'package:fashion_ecommerce_app/business_logics/wishlist_logic.dart';
import 'package:fashion_ecommerce_app/models/thumbnail.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyWishlistScreen extends StatefulWidget {
  Future<dynamic> thumbnailsApi;
  MyWishlistScreen({super.key, required this.thumbnailsApi});

  @override
  State<MyWishlistScreen> createState() => _MyWishlistScreenState();
}

class _MyWishlistScreenState extends State<MyWishlistScreen> {
  late List<Thumbnail> _filteredData;
  late List<String> _wishlist;
  bool _isLoading = false;

  Future<void> dataLoad() async {
    _wishlist = await WishListLogic.getWishlist();
    setState(() {
      _isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    dataLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          MyWishListScreenText.pageTitle,
          style: TextStyle(
            color: AppColors.tertiary,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading && _wishlist.isNotEmpty
          ? FutureBuilder(
              future: widget.thumbnailsApi,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          strokeAlign: 3,
                        ),
                        SizedBox(height: 15),
                        Text('Loading Wishlist ... '),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Column(
                    children: [
                      Text(snapshot.error.toString()),
                      Center(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              widget.thumbnailsApi = ProductApi.allProduct();
                            });
                          },
                          icon: Icon(Icons.refresh,
                              size: 20, color: AppColors.secondary),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasData) {
                  _filteredData = List<Thumbnail>.generate(
                      snapshot.data['limit'],
                      (index) =>
                          Thumbnail.formJson(snapshot.data['products'][index]));
                  _filteredData.removeWhere(
                      (value) => !_wishlist.contains(value.id.toString()));

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                        itemCount: _filteredData.length,
                        shrinkWrap: true,
                        //  physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return ProductCard(
                            thumbnailUrl: _filteredData[index].thumbnailUrl,
                            rating: _filteredData[index].rating!,
                            title: _filteredData[index].title!,
                            productId: _filteredData[index].id,
                            price: _filteredData[index].price!,
                            onPressIconButton: () {
                              setState(() {
                                dataLoad();
                              });
                            },
                          );
                        }),
                  );
                } else {
                  return const Center(child: Text('No text found'));
                }
              },
            )
          : Center(
              child: Text(
                MyWishListScreenText.emptyWishlist,
                style: TextStyle(
                    color: AppColors.tertiary,
                    fontSize: 40,
                    fontWeight: FontWeight.w300),
              ),
            ),
    );
  }
}
