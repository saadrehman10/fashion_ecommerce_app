import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          HomeScreenText.location,
                          style: TextStyle(
                              color: AppColors.textColorSubtitles,
                              fontSize: 10),
                        ),
                        DropdownButton<String>(
                          borderRadius: BorderRadius.circular(20),
                          items: [
                            DropdownMenuItem(
                                child: Row(
                              children: [
                                Icon(Icons.location_on,
                                    size: 20, color: AppColors.secondary),
                                const SizedBox(width: 5),
                                Text(HomeScreenText.dropDownMenuItemOne,
                                    style: TextStyle(
                                        color: AppColors.tertiary,
                                        fontSize: 20)),
                              ],
                            ))
                          ],
                          onChanged: (value) {},
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                            backgroundColor: AppColors.textColorSubtitles),
                        padding: const EdgeInsets.all(8),
                        icon: Icon(Icons.notifications,
                            size: 25, color: AppColors.tertiary))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
