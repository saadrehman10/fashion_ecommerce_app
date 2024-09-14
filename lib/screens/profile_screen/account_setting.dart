import 'package:flutter/material.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ListTile(
          title: const Text('Change Password'),
          onTap: () {
            Navigator.pushNamed(context, '/changePassword');
          },
          trailing: const Icon(Icons.keyboard_arrow_right, size: 20),
        ),
        ListTile(
          title: const Text('Update Information'),
          onTap: () {
            Navigator.pushNamed(context, '/editProfileScreen');
          },
          trailing: const Icon(Icons.keyboard_arrow_right, size: 20),
        ),
      ]),
    );
  }
}
