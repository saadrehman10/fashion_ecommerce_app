import 'dart:convert';
import 'package:fashion_ecommerce_app/models/countries.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/custom_textfield.dart';
import 'package:fashion_ecommerce_app/widgets/profile_picker/profile_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CompleteYourProfile extends StatefulWidget {
  const CompleteYourProfile({super.key});

  @override
  State<CompleteYourProfile> createState() => _CompleteYourProfileState();
}

class _CompleteYourProfileState extends State<CompleteYourProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _phoneNoController = TextEditingController();

  bool _isLoading = false;
  // ignore: unused_field
  ImageProvider? _receiveSelectedImage;

  CountryCode _dropDownValue =
      const CountryCode(countryName: 'Pakistan', countryCode: '+92');
  late List<CountryCode> _dropdownItemValues;

  String _genderDropdownValue = 'Gender';
  final List<String> _genderList = ['Gender', 'Male', 'Female', 'Others'];

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

  void _imgReceiver(ImageProvider? img) {
    setState(() {
      _receiveSelectedImage = img;
    });
  }

  void _completeProfileFunction() {
    Navigator.popUntil(context, ModalRoute.withName('/SignInScreen'));
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
    double screenWidth = MediaQuery.of(context).size.width;
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
              ProfilePicker(imgReturnFunction: _imgReceiver),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFromFelid(
                      controller: _phoneNoController,
                      labelText: TextfieldText.phoneHeading,
                      hintText: TextfieldText.phoneHint,
                      prefix: _isLoading
                          ? DropdownButton<CountryCode>(
                              padding: const EdgeInsets.only(left: 10),
                              underline: const SizedBox.shrink(),
                              menuMaxHeight: 300,
                              menuWidth: 300,
                              dropdownColor: AppColors.background,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              autofocus: true,
                              iconSize: 20,
                              style: TextStyle(
                                color: AppColors.tertiary,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              iconEnabledColor: AppColors.secondary,
                              borderRadius: BorderRadius.circular(20),
                              alignment: Alignment.bottomRight,
                              value: _dropDownValue,
                              selectedItemBuilder: (BuildContext context) {
                                return _dropdownItemValues
                                    .map((CountryCode country) {
                                  return Center(
                                    child: Text(
                                      country.countryCode,
                                      style: TextStyle(
                                        color: AppColors.tertiary,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  );
                                }).toList();
                              },

                              items: _dropdownItemValues
                                  .map(
                                    (CountryCode e) =>
                                        DropdownMenuItem<CountryCode>(
                                      value: e,
                                      child: Text(
                                          '${e.countryName} (${e.countryCode})'),
                                    ),
                                  )
                                  .toList(),

                              // Change the selected item when a new one is chosen
                              onChanged: (CountryCode? value) {
                                setState(() {
                                  _dropDownValue = value!;
                                });
                              },
                            )
                          : null,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return TextfieldText.phoneValidationOne;
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
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: AppColors.secondary,
                            width: 1,
                          ),
                        ),
                        child: DropdownButton<String>(
                          padding: const EdgeInsets.only(left: 10),
                          underline: const SizedBox.shrink(),
                          menuMaxHeight: 300,
                          menuWidth: screenWidth * .85,
                          dropdownColor: AppColors.background,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          autofocus: true,
                          iconSize: 20,
                          style: TextStyle(
                            color: AppColors.tertiary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          iconEnabledColor: AppColors.secondary,
                          borderRadius: BorderRadius.circular(20),
                          alignment: Alignment.centerRight,
                          isExpanded: true,
                          value: _genderDropdownValue,
                          items: _genderList
                              .map((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _genderDropdownValue = value!;
                            });
                          },
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 0),
                          backgroundColor: AppColors.secondary,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _completeProfileFunction();
                          }
                        },
                        child: Text(
                          ButtonText.completeProfile,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 20,
                          ),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
