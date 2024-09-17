import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFromFelid extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final Widget? prefix;
  Widget? suffixIcon;
  bool? obscureText;

  CustomTextFromFelid({
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.validator,
    required this.keyboardType,
    this.suffixIcon,
    this.obscureText,
    this.prefix,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      autofocus: false,
      style: TextStyle(color: AppColors.tertiary),
      decoration: InputDecoration(
        prefix: prefix,
        suffixIcon: suffixIcon,
        fillColor: AppColors.tertiary,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        floatingLabelStyle: TextStyle(
          color: AppColors.tertiary,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(
            color: AppColors.secondary,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        hintStyle: TextStyle(
          color: AppColors.textColorSubtitles,
        ),
        labelText: labelText,
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}
