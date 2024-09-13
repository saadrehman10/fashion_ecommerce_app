import 'package:fashion_ecommerce_app/business_logics/my_cart_logic.dart';
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
                return ListView.builder(
                    itemCount: _myCartData.length,
                    itemBuilder: (context, index) {
                      return Text(_myCartData[index]);
                    });
              },
            )
          : null,
    );
  }
}
