import 'package:fashion_ecommerce_app/apis/product_api.dart';
import 'package:fashion_ecommerce_app/screens/chat_screen/chat_screen.dart';
import 'package:fashion_ecommerce_app/screens/home_screen/home_screen.dart';
import 'package:fashion_ecommerce_app/screens/my_cart_screen/my_cart_screen.dart';
import 'package:fashion_ecommerce_app/screens/my_wishlist_screen/my_wishlist_screen.dart';
import 'package:fashion_ecommerce_app/screens/profile_screen/profile_screen.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// ignore: must_be_immutable
class LayoutPage extends StatefulWidget {
  int? currentLayout;
  LayoutPage({super.key, this.currentLayout});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int currentWidgetIndex = 0;
  late List<Widget> currentWidget;

  @override
  void initState() {
    super.initState();
    currentWidgetIndex = widget.currentLayout ?? 0;
    final apiData = ProductApi.allProduct();
    currentWidget = [
      HomeScreen(thumbnailsApi: apiData),
      MyCartScreen(thumbnailsApi: apiData),
      MyWishlistScreen(thumbnailsApi: apiData),
      const ChatPage(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SizedBox(height: screenHeight, child: currentWidget[currentWidgetIndex]),
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
                          backgroundColor: AppColors.primary, padding: const EdgeInsets.all(15))
                      : null,
                  icon: Icon(currentWidgetIndex == 0 ? Iconsax.home_25 : Iconsax.home_2,
                      color: currentWidgetIndex == 0 ? AppColors.secondary : AppColors.primary),
                  onPressed: () {
                    const int index = 0;
                    setState(() {
                      currentWidgetIndex = index;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Iconsax.bag_2, color: Colors.white),
                  onPressed: () async {
                    int index = 1;
                    final result = await Navigator.push(
                        context, MaterialPageRoute(builder: (context) => currentWidget[index]));
                    if (result == null) {
                      setState(() {});
                    }
                  },
                ),
                IconButton(
                  style: currentWidgetIndex == 2
                      ? IconButton.styleFrom(
                          backgroundColor: AppColors.primary, padding: const EdgeInsets.all(15))
                      : null,
                  icon: Icon(currentWidgetIndex == 2 ? Iconsax.heart5 : Iconsax.heart,
                      color: currentWidgetIndex == 2 ? AppColors.secondary : AppColors.primary),
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
                          backgroundColor: AppColors.primary, padding: const EdgeInsets.all(15))
                      : null,
                  icon: Icon(Iconsax.message4, color: AppColors.primary),
                  onPressed: () {
                    int index = 3;
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => currentWidget[index]));
                  },
                ),
                IconButton(
                  style: currentWidgetIndex == 4
                      ? IconButton.styleFrom(
                          backgroundColor: AppColors.primary, padding: const EdgeInsets.all(15))
                      : null,
                  icon: Icon(currentWidgetIndex == 4 ? Icons.person : Icons.person_outline,
                      color: currentWidgetIndex == 4 ? AppColors.secondary : AppColors.primary),
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
