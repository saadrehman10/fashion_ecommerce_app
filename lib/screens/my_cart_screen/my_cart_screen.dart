import 'package:fashion_ecommerce_app/apis/product_api.dart';
import 'package:fashion_ecommerce_app/business_logics/my_cart_logic.dart';
import 'package:fashion_ecommerce_app/models/thumbnail.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class MyCartScreen extends StatefulWidget {
  Future<dynamic> thumbnailsApi;
  MyCartScreen({super.key, required this.thumbnailsApi});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  late List<String> _myCartData;
  bool _isLoading = false;

  Future<void> dataLoad() async {
    _myCartData = await MyCart.getCartData();
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
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          MyCardScreenText.pageTitle,
          style: TextStyle(
            color: AppColors.tertiary,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? FutureBuilder(
              future: widget.thumbnailsApi,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Column(
                    children: [
                      Text(
                        snapshot.error.toString(),
                      ),
                      IconButton(
                        onPressed: () => setState(() {
                          widget.thumbnailsApi = ProductApi.allProduct();
                        }),
                        icon: const Icon(Icons.refresh),
                      ),
                    ],
                  );
                } else if (snapshot.hasData) {
                  List<Thumbnail> filteredData = List<Thumbnail>.generate(
                      snapshot.data['limit'],
                      (index) =>
                          Thumbnail.formJson(snapshot.data['products'][index]));
                  filteredData.removeWhere(
                      (value) => !_myCartData.contains(value.id.toString()));
                  return ListView.builder(
                      itemCount: filteredData.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                            key: Key(filteredData[index].id.toString()),
                            background: Container(
                              color: Colors.red[400],
                              child: const Icon(Icons.delete,
                                  size: 25, color: Colors.white),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  Container(
                                      height: screenHeight * .1,
                                      width: screenHeight * .1,
                                      decoration: BoxDecoration(
                                        color: AppColors.background,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Image.network(
                                        filteredData[index].thumbnailUrl,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Icon(Icons.error,
                                                    size: 25,
                                                    color: AppColors
                                                        .textColorSubtitles),
                                      )),
                                  const SizedBox(width: 20),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        filteredData[index].title!,
                                        style: TextStyle(
                                          color: AppColors.tertiary,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Size: XL',
                                        style: TextStyle(
                                          color: AppColors.textColorSubtitles,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '\$${filteredData[index].price}',
                                            style: TextStyle(
                                              color: AppColors.tertiary,
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(width: 100),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                    color: AppColors
                                                        .textColorSubtitles,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                  ),
                                                  child: const Center(
                                                    child: Icon(
                                                        FontAwesomeIcons.minus,
                                                        color: Colors.black,
                                                        size: 13),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Text('1',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: AppColors.tertiary,
                                                  )),
                                              const SizedBox(width: 5),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.secondary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                  ),
                                                  child: const Center(
                                                    child: Icon(Icons.add,
                                                        color: Colors.white,
                                                        size: 15),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ));
                      });
                } else {
                  return const Placeholder();
                }
              },
            )
          : null,
    );
  }
}
