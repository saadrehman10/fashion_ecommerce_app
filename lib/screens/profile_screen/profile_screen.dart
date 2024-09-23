import 'package:fashion_ecommerce_app/business_logics/login_logic.dart';
import 'package:fashion_ecommerce_app/models/user.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/profile_picker/profile_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late bool? _loginStatus;
  bool _isLoading = false;
  late User userData;
  late double screenWidth;
  //profile tiles data
  List<Map<String, dynamic>> profilePickerItems = [];

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

    _populateProfilePickerItems();
  }

  void _populateProfilePickerItems() {
    profilePickerItems = [
      {'icon': Iconsax.user, 'title': 'Your profile', 'onTapFunction': () {}},
      {'icon': Iconsax.card, 'title': 'Payment Methods', 'onTapFunction': () {}},
      {'icon': Iconsax.note, 'title': 'My Orders', 'onTapFunction': () {}},
      {'icon': Iconsax.setting_2, 'title': 'Settings', 'onTapFunction': () {}},
      {'icon': Iconsax.info_circle, 'title': 'Help Center', 'onTapFunction': () {}},
      {'icon': Iconsax.lock, 'title': 'Privacy Policy', 'onTapFunction': () {}},
      {'icon': Iconsax.user_add, 'title': 'Invite Friends', 'onTapFunction': () {}},
      {
        'icon': Iconsax.logout_1,
        'title': 'Log out',
        'onTapFunction': () async {
          bool? loginBool = await showModalBottomSheet<bool>(
            context: context,
            builder: (context) {
              return Container(
                padding: const EdgeInsets.all(20),
                height: screenWidth * .3,
                width: screenWidth,
                child: Column(
                  children: [
                    Text(
                      ProfileScreenText.logout,
                      style: TextStyle(
                        color: AppColors.tertiary,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.textColorSubtitles.withOpacity(.2)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      ProfileScreenText.confirmLogout,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textColorSubtitles,
                        fontSize: 16,
                      ),
                    ),
                    Row()
                  ],
                ),
              );
            },
          );
          if (loginBool != null && loginBool) {
            await LoginStatusLogic.setLoginStatus(false);
            setState(() {
              _isLoading = false;
            });
          }
        }
      },
    ];
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
    screenWidth = MediaQuery.of(context).size.width;
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
                      (userData.fullName ?? ProfileScreenText.username).capitalize,
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
                        trailing:
                            Icon(Icons.keyboard_arrow_right, color: AppColors.secondary, size: 30),
                        onTap: profilePickerItems[index]['onTapFunction'],
                      ),
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
                      color: AppColors.tertiary, fontSize: 35, fontWeight: FontWeight.w300),
                  children: [
                    TextSpan(
                      text: ProfileScreenText.singInNow,
                      style: TextStyle(
                          color: AppColors.secondary, fontSize: 35, fontWeight: FontWeight.w300),
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
