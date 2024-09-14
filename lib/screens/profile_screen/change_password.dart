import 'package:flutter/material.dart';
import 'package:wear_craft/widgets/custom_app_bar/custom_app_bar.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  void _changePassword() {
    // final String currentPassword = _currentPasswordController.text;
    // final String newPassword = _newPasswordController.text;
    // final String confirmNewPassword = _confirmNewPasswordController.text;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Password changed successfully'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: 'Change Password'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text('Change Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  )),
              const SizedBox(height: 10),
              _buildTextFormField(
                controller: _currentPasswordController,
                labelText: 'Current Password',
                hintText: '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Current Password';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              _buildTextFormField(
                controller: _newPasswordController,
                labelText: 'New Password',
                hintText: '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your new password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  if (value == _currentPasswordController.text) {
                    return 'New password must be different from current password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              _buildTextFormField(
                controller: _confirmNewPasswordController,
                labelText: 'Confirm New Password',
                hintText: '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter new password again';
                  }
                  if (value != _newPasswordController.text) {
                    return 'Password does not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(
                      horizontal: (screenWidth / 2) * .5, vertical: 15),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _changePassword();
                  }
                },
                child: const Text('Change Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    )),
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
          borderRadius:const  BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        hintStyle: const TextStyle(
          color:  Color.fromARGB(183, 158, 158, 158),
        ),
        labelText: labelText,
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}
