import 'package:fashion_ecommerce_app/apis/product_api.dart';
import 'package:fashion_ecommerce_app/business_logics/login_logic.dart';
import 'package:fashion_ecommerce_app/business_logics/my_cart_logic.dart';
import 'package:fashion_ecommerce_app/models/thumbnail.dart';
import 'package:fashion_ecommerce_app/screens/checkout_screen/checkout_screen.dart';
import 'package:fashion_ecommerce_app/screens/my_cart_screen/widgets.dart';
import 'package:fashion_ecommerce_app/screens/signin_login_screen/signin_screen.dart';
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
  late bool _isLogin;

  double _subtotal = 0, _discount = 0, _delivery = 0;

  Future<void> dataLoad() async {
    _myCartData = await MyCart.getCartData();
    _isLogin = await LoginStatusLogic.getLoginStatus();
    setState(() {
      _isLoading = true;
    });
  }

  double _deliveryPrice() {
    _delivery = _subtotal * .3;
    return _delivery;
  }

  double _discountPrice() {
    _discount = _subtotal * .1;
    return _discount;
  }

  double _subTotal({required List<Thumbnail> prices}) {
    double sum = 0;
    for (var element in prices) {
      sum += element.price!;
    }
    _subtotal = sum;
    return sum;
  }

  double _total() {
    return (_subtotal + _delivery) - _discount;
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          strokeAlign: 3,
                        ),
                        SizedBox(height: 15),
                        Text('Loading Cart ....'),
                      ],
                    ),
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
                  _filteredData = List<Thumbnail>.generate(snapshot.data['limit'],
                      (index) => Thumbnail.formJson(snapshot.data['products'][index]));
                  _filteredData.removeWhere((value) => !_myCartData.contains(value.id.toString()));
                  debugPrint(_filteredData.toString());
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _filteredData.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                key: UniqueKey(),
                                direction: DismissDirection.endToStart,
                                dismissThresholds: const {
                                  DismissDirection.endToStart: 0.35,
                                },
                                confirmDismiss: (DismissDirection direction) async {
                                  if (direction == DismissDirection.endToStart) {
                                    return await showModalBottomSheet<bool>(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          padding: const EdgeInsets.symmetric(vertical: 20),
                                          height: screenWidth * .75,
                                          child: Column(
                                            children: [
                                              Text(
                                                PopMessages.deleteFromCart,
                                                style: TextStyle(
                                                  color: AppColors.tertiary,
                                                  fontSize: 30,
                                                ),
                                              ),
                                              CustomListTile(
                                                thumbnailUrl: _filteredData[index].thumbnailUrl,
                                                title: _filteredData[index].title!,
                                                price: _filteredData[index].price!,
                                                productId: _filteredData[index].id,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 20, vertical: 10),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop(false);
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                          padding: const EdgeInsets.symmetric(
                                                              vertical: 15),
                                                          backgroundColor: AppColors.background,
                                                        ),
                                                        child: Text(ButtonText.cancel,
                                                            style: TextStyle(
                                                              color: AppColors.secondary,
                                                              fontSize: 18,
                                                            )),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Expanded(
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop(true);
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                          padding: const EdgeInsets.symmetric(
                                                              vertical: 15),
                                                          backgroundColor: AppColors.secondary,
                                                        ),
                                                        child: Text(ButtonText.remove,
                                                            style: TextStyle(
                                                              color: AppColors.primary,
                                                              fontSize: 18,
                                                            )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }
                                  return true;
                                },
                                onDismissed: (direction) {
                                  if (direction == DismissDirection.endToStart) {
                                    MyCart.deleteMyCart(productId: _filteredData[index].id);
                                    setState(() {
                                      dataLoad();
                                    });
                                  }
                                },
                                background: Container(
                                  padding: const EdgeInsets.only(right: 30),
                                  color: Colors.red[100],
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.delete, size: 25, color: Colors.red),
                                    ],
                                  ),
                                ),
                                child: CustomListTile(
                                  thumbnailUrl: _filteredData[index].thumbnailUrl,
                                  title: _filteredData[index].title!,
                                  price: _filteredData[index].price!,
                                  productId: _filteredData[index].id,
                                ),
                              );
                            }),
                      ),
                      Container(
                        padding: const EdgeInsets.all(30),
                        height: screenHeight * .35,
                        width: screenWidth,
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                            boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 20)]),
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
                                          hintText: MyCartScreenText.hintTextTextFelid,
                                          hintStyle: TextStyle(color: Colors.grey.withOpacity(.6)),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 14, horizontal: 30),
                                            backgroundColor: AppColors.secondary),
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
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(MyCartScreenText.subTotal,
                                    style: TextStyle(
                                        color: AppColors.textColorSubtitles, fontSize: 17)),
                                Text('\$${_subTotal(prices: _filteredData).toStringAsFixed(2)}',
                                    style: TextStyle(color: AppColors.tertiary, fontSize: 17)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(MyCartScreenText.delivery,
                                    style: TextStyle(
                                        color: AppColors.textColorSubtitles, fontSize: 17)),
                                Text('\$${_deliveryPrice().toStringAsFixed(2)}',
                                    style: TextStyle(color: AppColors.tertiary, fontSize: 17)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(MyCartScreenText.discount,
                                    style: TextStyle(
                                        color: AppColors.textColorSubtitles, fontSize: 17)),
                                Text('\$${_discountPrice().toStringAsFixed(2)}',
                                    style: TextStyle(color: AppColors.tertiary, fontSize: 17)),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(MyCartScreenText.total,
                                    style: TextStyle(
                                        color: AppColors.textColorSubtitles, fontSize: 20)),
                                Text('\$${_total().toStringAsFixed(2)}',
                                    style: TextStyle(color: AppColors.tertiary, fontSize: 20)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_isLogin) {
                                        Navigator.pushNamed(context, '/CheckoutScreen');
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(
                                                MyCartScreenText.alertDialogTitle,
                                                style: TextStyle(
                                                  color: AppColors.tertiary,
                                                ),
                                              ),
                                              content: Text(
                                                MyCartScreenText.alertDialogContext,
                                                style: TextStyle(
                                                  color: AppColors.tertiary,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text(ButtonText.cancel),
                                                ),
                                                TextButton(
                                                    onPressed: () async {
                                                      Navigator.of(context).pop();
                                                      final result = await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => SignInScreen(
                                                            navigateToSingInScreen:
                                                                const CheckoutScreen(),
                                                          ),
                                                        ),
                                                      );







                                                      
                                                      if (result == null) {
                                                        setState(() {});
                                                      } else {
                                                        setState(() {});
                                                      }
                                                    },
                                                    child: const Text(ButtonText.singIn))
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                      backgroundColor: AppColors.secondary,
                                    ),
                                    child: Text(
                                      ButtonText.checkout,
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                style:
                    TextStyle(color: AppColors.tertiary, fontSize: 40, fontWeight: FontWeight.w300),
              ),
            ),
    );
  }
}
