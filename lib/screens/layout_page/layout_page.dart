import 'package:fashion_ecommerce_app/apis/product_api.dart';
import 'package:fashion_ecommerce_app/screens/home_screen/home_screen.dart';
import 'package:fashion_ecommerce_app/screens/my_cart/my_cart.dart';
import 'package:fashion_ecommerce_app/screens/my_wishlist_screen/my_wishlist_screen.dart';
import 'package:flutter/material.dart';

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
      const MyCartScreen(),
      const MyWishlistScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        currentWidget[currentWidgetIndex],
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(30),
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
                  icon: const Icon(Icons.home, color: Colors.brown),
                  onPressed: () {
                    const int index = 0;
                    setState(() {
                      currentWidgetIndex = index;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.lock_outline, color: Colors.white),
                  onPressed: () {
                    const int index = 1;
                    setState(() {
                      currentWidgetIndex = index;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.white),
                  onPressed: () {
                    const int index = 2;
                    setState(() {
                      currentWidgetIndex = index;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.chat_bubble_outline,
                      color: Colors.white),
                  onPressed: () {
                    const int index = 3;
                    setState(() {
                      currentWidgetIndex = index;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.person_outline, color: Colors.white),
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
