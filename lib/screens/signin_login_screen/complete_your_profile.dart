import 'dart:convert';
import 'dart:math';

import 'package:fashion_ecommerce_app/models/countries.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CompleteYourProfile extends StatefulWidget {
  const CompleteYourProfile({super.key});

  @override
  State<CompleteYourProfile> createState() => _CompleteYourProfileState();
}

class _CompleteYourProfileState extends State<CompleteYourProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _phoneNoController = TextEditingController();
  CountryCode _dropDownValue =
      const CountryCode(countryName: 'PK', countryCode: '+92');
  late List<CountryCode> _dropdownItemValues;
  bool _isLoading = false;
  Future<void> _countryCodeData() async {
    String jsonString =
        await rootBundle.loadString('assets/data/country_code.json');

    final jsonResponse = json.decode(jsonString);
    _dropdownItemValues = List.generate(jsonResponse.length,
        (index) => CountryCode.formJson(jsonResponse[index]));
    setState(() {
      _isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _countryCodeData();
  }

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
                const SizedBox(height: 40),
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
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFromFelid(
                        controller: _phoneNoController,
                        labelText: 'Phone',
                        hintText: '123456789',
                        prefix: _isLoading
                            ? DropdownButton<CountryCode>(
                                padding: const EdgeInsets.only(left: 5),
                                underline: const SizedBox.shrink(),
                                dropdownColor: AppColors.background,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                autofocus: true,
                                iconSize: 20,
                                menuMaxHeight: 300,
                                style: TextStyle(
                                  color: AppColors.tertiary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                iconEnabledColor: AppColors.secondary,
                                borderRadius: BorderRadius.circular(20),
                                alignment: Alignment.bottomRight,
                                value:
                                    _dropDownValue, // Now, CountryCode object can be used correctly
                                items: _dropdownItemValues
                                    .map(
                                      (e) => DropdownMenuItem<CountryCode>(
                                        value:
                                            e, // CountryCode object assigned to value
                                        child: Text(
                                            '${e.countryName} (${e.countryCode})'),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (CountryCode? value) {
                                  setState(() {
                                    _dropDownValue = value!;
                                  });
                                },
                              )
                            : null,
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
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          color: Colors.red,
                          child: DropdownButton(
                            items: [],
                            onChanged: (value) {},
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
