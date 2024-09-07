import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFromFelid extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  Widget? suffixIcon;
  bool? obscureText;

  CustomTextFromFelid(
      {required this.controller,
      required this.labelText,
      required this.hintText,
      required this.validator,
      required this.keyboardType,
      this.suffixIcon,
      this.obscureText,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      autofocus: false,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.white,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.white,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        hintStyle: const TextStyle(
          color: Color.fromARGB(183, 158, 158, 158),
        ),
        labelText: labelText,
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}
