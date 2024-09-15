import 'package:fashion_ecommerce_app/apis/product_api.dart';
import 'package:fashion_ecommerce_app/business_logics/my_cart_logic.dart';
import 'package:fashion_ecommerce_app/models/thumbnail.dart';
import 'package:fashion_ecommerce_app/screens/my_cart_screen/widgets.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyCartScreen extends StatefulWidget {
  Future<dynamic> thumbnailsApi;
  MyCartScreen({super.key, required this.thumbnailsApi});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  late List<Thumbnail> _filteredData;
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
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          MyCartScreenText.pageTitle,
          style: TextStyle(
            color: AppColors.tertiary,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading && _myCartData.isNotEmpty
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
                  _filteredData = List<Thumbnail>.generate(
                      snapshot.data['limit'],
                      (index) =>
                          Thumbnail.formJson(snapshot.data['products'][index]));
                  _filteredData.removeWhere(
                      (value) => !_myCartData.contains(value.id.toString()));
                  debugPrint(_filteredData.toString());
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                            itemCount: _filteredData.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                key: Key(_filteredData[index].id.toString()),
                                direction: DismissDirection.endToStart,
                                dismissThresholds: const {
                                  DismissDirection.endToStart: 0.35,
                                },
                                confirmDismiss:
                                    (DismissDirection direction) async {
                                  if (direction ==
                                      DismissDirection.endToStart) {
                                    return await showDialog<bool>(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Confirm'),
                                        content: const Text(
                                            'Are you sure you want to delete?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.of(context)
                                                    .pop(false),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(true),
                                            child: const Text('Delete'),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  return true;
                                },
                                onDismissed: (direction) {
                                  if (direction ==
                                      DismissDirection.endToStart) {
                                    MyCart.deleteMyCart(
                                        productId: _filteredData[index].id);
                                  }
                                },
                                background: Container(
                                  padding: const EdgeInsets.only(right: 30),
                                  color: Colors.red[100],
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.delete,
                                          size: 25, color: Colors.red),
                                    ],
                                  ),
                                ),
                                child: CustomListTile(
                                  thumbnailUrl:
                                      _filteredData[index].thumbnailUrl,
                                  title: _filteredData[index].title!,
                                  price: _filteredData[index].price!,
                                ),
                              );
                            }),
                      ),
                      Container(
                        height: screenHeight * .35,
                        width: screenWidth,
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, blurRadius: 20)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        TextField(
                                          decoration: InputDecoration(
                                            hintText: MyCartScreenText
                                                .hintTextTextFelid,
                                            hintStyle: TextStyle(
                                                color: Colors.grey
                                                    .withOpacity(.6)),
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 14,
                                                      horizontal: 30),
                                              backgroundColor:
                                                  AppColors.secondary),
                                          child: Text(ButtonText.apply,
                                              style: TextStyle(
                                                color: AppColors.primary,
                                                fontSize: 20,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Placeholder();
                }
              },
            )
          : Center(
              child: Text(
                MyCartScreenText.emptyCart,
                style: TextStyle(
                    color: AppColors.tertiary,
                    fontSize: 40,
                    fontWeight: FontWeight.w300),
              ),
            ),
    );
  }
}
