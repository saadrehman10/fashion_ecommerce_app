import 'package:fashion_ecommerce_app/business_logics/login_logic.dart';
import 'package:fashion_ecommerce_app/models/user.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
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

  Future<void> _checkLogin() async {
    _loginStatus = await LoginStatusLogic.getLoginStatus();
    if (_loginStatus!) {
      userData = await LoginStatusLogic.getUserData();
    }
    setState(() {
      _isLoading = true;
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
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(userData.image!),
                    onBackgroundImageError: (exception, stackTrace) => Icon(
                        Icons.error,
                        color: AppColors.textColorSubtitles,
                        size: 20),
                    radius: 50,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    ProfileScreenText.username,
                    style: TextStyle(
                      color: AppColors.tertiary,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
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
