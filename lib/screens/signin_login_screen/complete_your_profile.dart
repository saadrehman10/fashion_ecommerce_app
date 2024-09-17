import 'dart:math';

import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CompleteYourProfile extends StatefulWidget {
  const CompleteYourProfile({super.key});

  @override
  State<CompleteYourProfile> createState() => _CompleteYourProfileState();
}

class _CompleteYourProfileState extends State<CompleteYourProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _phoneNoController = TextEditingController();
  String _dropDownValue = '+92';
  final List<String> _dropdownItemValues = ['+92', '+93', '+94', '+95'];

  @override
  void dispose() {
    _phoneNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  CreateAccountScreenText.completeYourProfileTitle,
                  style: TextStyle(
                    color: AppColors.tertiary,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Text(CreateAccountScreenText.completeYourProfileWelcomeText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textColorSubtitles,
                      fontSize: 20,
                    )),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    debugPrint('ON working here');
                  },
                  child: Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.grey[200],
                          // ignore: deprecated_member_use
                          child: const Icon(FontAwesomeIcons.userAlt,
                              size: 50, color: Colors.grey),
                        ),
                        IconButton(
                          onPressed: () {
                            debugPrint('ON working here');
                          },
                          style: IconButton.styleFrom(
                              padding: const EdgeInsets.all(10),
                              backgroundColor: AppColors.secondary),
                          iconSize: 15,
                          icon: const Icon(
                            FontAwesomeIcons.pen,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFromFelid(
                        controller: _phoneNoController,
                        labelText: 'Phone',
                        hintText: '123456789',
                        prefix: DropdownButton<String>(
                          padding: const EdgeInsets.only(left: 20),
                          underline: const SizedBox.shrink(),
                          value: _dropDownValue,
                          items: _dropdownItemValues
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _dropDownValue = value!;
                            });
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a phone number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
