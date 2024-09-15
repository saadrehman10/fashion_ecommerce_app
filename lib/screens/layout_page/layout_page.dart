import 'package:fashion_ecommerce_app/apis/product_api.dart';
import 'package:fashion_ecommerce_app/screens/chat_screen/chat_screen.dart';
import 'package:fashion_ecommerce_app/screens/home_screen/home_screen.dart';
import 'package:fashion_ecommerce_app/screens/my_cart_screen/my_cart_screen.dart';
import 'package:fashion_ecommerce_app/screens/my_wishlist_screen/my_wishlist_screen.dart';
import 'package:fashion_ecommerce_app/screens/profile_screen/profile_screen.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int currentWidgetIndex = 0;
  late List<Widget> currentWidget;

  @override
  void initState() {
    super.initState();
    currentWidget = [
      HomeScreen(thumbnailsApi: ProductApi.allProduct()),
      MyCartScreen(thumbnailsApi: ProductApi.allProduct()),
      MyWishlistScreen(thumbnailsApi: ProductApi.allProduct()),
      ChatPage(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SizedBox(
            height: screenHeight, child: currentWidget[currentWidgetIndex]),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5), // Shadow position
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  style: currentWidgetIndex == 0
                      ? IconButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.all(15))
                      : null,
                  icon: Icon(Icons.home,
                      color: currentWidgetIndex == 0
                          ? AppColors.secondary
                          : AppColors.primary),
                  onPressed: () {
                    const int index = 0;
                    setState(() {
                      currentWidgetIndex = index;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.bagShopping,
                      color: Colors.white),
                  onPressed: () {
                    int index = 1;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => currentWidget[index]));
                  },
                ),
                IconButton(
                  style: currentWidgetIndex == 2
                      ? IconButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.all(15))
                      : null,
                  icon: Icon(Icons.favorite,
                      color: currentWidgetIndex == 2
                          ? AppColors.secondary
                          : AppColors.primary),
                  onPressed: () {
                    const int index = 2;
                    setState(() {
                      currentWidgetIndex = index;
                    });
                  },
                ),
                IconButton(
                  style: currentWidgetIndex == 3
                      ? IconButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.all(15))
                      : null,
                  icon: Icon(Icons.chat_bubble,
                      color: currentWidgetIndex == 3
                          ? AppColors.secondary
                          : AppColors.primary),
                  onPressed: () {
                    const int index = 3;
                    setState(() {
                      currentWidgetIndex = index;
                    });
                  },
                ),
                IconButton(
                  style: currentWidgetIndex == 4
                      ? IconButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.all(15))
                      : null,
                  icon: Icon(Icons.person,
                      color: currentWidgetIndex == 4
                          ? AppColors.secondary
                          : AppColors.primary),
                  onPressed: () {
                    const int index = 4;
                    setState(() {
                      currentWidgetIndex = index;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
