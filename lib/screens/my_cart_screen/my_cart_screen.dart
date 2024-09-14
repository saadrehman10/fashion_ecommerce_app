import 'package:fashion_ecommerce_app/apis/product_api.dart';
import 'package:fashion_ecommerce_app/business_logics/my_cart_logic.dart';
import 'package:fashion_ecommerce_app/models/thumbnail.dart';
import 'package:fashion_ecommerce_app/screens/my_cart_screen/widgets.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenHeight < screenWidth) {
      screenWidth *= 1.45;
    }

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
                            direction: DismissDirection.endToStart,
                            dismissThresholds: const {
                              DismissDirection.endToStart: 0.35,
                            },
                            confirmDismiss: (DismissDirection direction) async {
                              if (direction == DismissDirection.endToStart) {
                                return await showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Confirm'),
                                    content: const Text(
                                        'Are you sure you want to delete?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
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
                              thumbnailUrl: filteredData[index].thumbnailUrl,
                              title: filteredData[index].title!,
                              price: filteredData[index].price!,
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
