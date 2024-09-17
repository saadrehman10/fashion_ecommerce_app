import 'package:fashion_ecommerce_app/widgets/profile_picker/profile_picker.dart';
import 'package:flutter/material.dart';
import 'package:custom_image_crop/custom_image_crop.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  late CustomImageCropController controller;
  @override
  void initState() {
    super.initState();
    controller = CustomImageCropController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    controller.dispose();
    super.dispose();
  }

  void _saveForm() {
    // final String firstName = _firstNameController.text;
    // final String lastName = _lastNameController.text;
    // final String phoneNumber = _phoneNumberController.text;
    // final String address = _addressController.text;
    // final String email = _emailController.text;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Profile Updated Successfully'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfilePicker(),
                ],
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    _buildTextFormField(
                      controller: _firstNameController,
                      labelText: 'First Name',
                      hintText: 'John',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildTextFormField(
                      controller: _lastNameController,
                      labelText: 'Last Name',
                      hintText: 'Doe',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildTextFormField(
                      controller: _phoneNumberController,
                      labelText: 'Phone Number',
                      hintText: '03131122334',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone no';
                        }
                        if (value.length != 11 || value[0] != '0') {
                          return 'Please enter a valid phone no';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildTextFormField(
                      controller: _addressController,
                      labelText: 'Address',
                      hintText: '123 Main St',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildTextFormField(
                      controller: _emailController,
                      labelText: 'Email',
                      hintText: 'johndoe@example.com',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Email';
                        }
                        if (!value.contains('@') || !value.contains('.')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: Theme.of(context).primaryColor,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _saveForm();
                              }
                            },
                            child: const Text('Save',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.black,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
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
