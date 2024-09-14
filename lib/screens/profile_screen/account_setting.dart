import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar/custom_app_bar.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Account Setting'),
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
