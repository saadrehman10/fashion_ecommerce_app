import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            CheckoutScreenText.pageTitle,
            style: TextStyle(
              color: AppColors.tertiary,
              fontSize: 21,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        body: const Placeholder());
  }
}
