import 'package:fashion_ecommerce_app/business_logics/login_logic.dart';
import 'package:fashion_ecommerce_app/models/user.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/profile_picker/profile_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late bool? _loginStatus;
  bool _isLoading = false;
  late User userData;
  //profile tiles data
  List<Map<String, dynamic>> profilePickerItems = [
    {'icon': Icons.person, 'title': 'Your profile', 'onTapFunction': () {}},
    {'icon': Icons.payment, 'title': 'Payment Methods', 'onTapFunction': () {}},
    {'icon': Icons.receipt_long, 'title': 'My Orders', 'onTapFunction': () {}},
    {'icon': Icons.settings, 'title': 'Settings', 'onTapFunction': () {}},
    {
      'icon': Icons.help_outline,
      'title': 'Help Center',
      'onTapFunction': () {}
    },
    {'icon': Icons.lock, 'title': 'Privacy Policy', 'onTapFunction': () {}},
    {'icon': Icons.group, 'title': 'Invite Friends', 'onTapFunction': () {}},
    {'icon': Icons.logout, 'title': 'Log out', 'onTapFunction': () {}},
  ];

  // ignore: unused_field
  ImageProvider? _receiveSelectedImage;

  Future<void> _checkLogin() async {
    _loginStatus = await LoginStatusLogic.getLoginStatus();
    if (_loginStatus!) {
      userData = await LoginStatusLogic.getUserData();
    }
    setState(() {
      _isLoading = true;
    });
  }

  void _imgReceiver(ImageProvider? img) {
    setState(() {
      _receiveSelectedImage = img;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isLoading && _loginStatus!
          ? AppBar(
              title: Text(
                ProfileScreenText.pageTitle,
                style: TextStyle(
                  color: AppColors.tertiary,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              centerTitle: true,
            )
          : null,
      body: _isLoading && _loginStatus!
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfilePicker(
                      imgReturnFunction: _imgReceiver,
                      profileImage: userData.image,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      (userData.fullName ?? ProfileScreenText.username)
                          .capitalize,
                      style: TextStyle(
                        color: AppColors.tertiary,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...List.generate(
                      profilePickerItems.length,
                      (index) => ListTile(
                        leading: Icon(
                          profilePickerItems[index]['icon'],
                          color: AppColors.secondary,
                          size: 30,
                        ),
                        title: Text(profilePickerItems[index]['title']),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: AppColors.secondary, size: 30),
                        onTap: profilePickerItems[index]['onTapFunction'],
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        await LoginStatusLogic.setLoginStatus(false);
                        setState(() {
                          _isLoading = false;
                        });
                      },
                      child: const Text('logout'),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: ProfileScreenText.notLoggedIn,
                  style: TextStyle(
                      color: AppColors.tertiary,
                      fontSize: 35,
                      fontWeight: FontWeight.w300),
                  children: [
                    TextSpan(
                      text: ProfileScreenText.singInNow,
                      style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: 35,
                          fontWeight: FontWeight.w300),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/SignInScreen');
                        },
                    ),
                  ]),
            )),
    );
  }
}
