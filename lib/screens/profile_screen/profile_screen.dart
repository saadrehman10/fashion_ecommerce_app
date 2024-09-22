import 'package:fashion_ecommerce_app/apis/data.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/images.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late bool? _loginStatus;
  bool _isLoading = false;
  Future<void> _checkLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      _loginStatus = sp.getBool('loginStatus');
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
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

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
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage(AppImages.welcomeScreenImgThree),
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
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: profilesData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(profilesData[index]['leadingIcon'],
                            size: 25, color: AppColors.secondary),
                        title: Text(profilesData[index]['title'],
                            style: TextStyle(
                              color: AppColors.tertiary,
                              fontSize: 20,
                            )),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            size: 30, color: AppColors.secondary),
                      );
                    },
                  )
                ],
              ),
            )
          : Center(
              child: Text(
                ProfileScreenText.notLoggedIn,
                style: TextStyle(
                    color: AppColors.tertiary,
                    fontSize: 40,
                    fontWeight: FontWeight.w300),
              ),
            ),
    );
  }
}
