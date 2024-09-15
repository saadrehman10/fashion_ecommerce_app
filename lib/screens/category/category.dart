import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String title;
  const Category({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        title,
        style: TextStyle(
          color: AppColors.tertiary,
          fontSize: 21,
          fontWeight: FontWeight.w300,
        ),
      )),
    );
  }
}
