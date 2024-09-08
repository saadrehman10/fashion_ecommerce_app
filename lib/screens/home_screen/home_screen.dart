import 'dart:ui';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          HomeScreenText.location,
                          style: TextStyle(
                              color: AppColors.textColorSubtitles,
                              fontSize: 15),
                        ),
                        DropdownButton<String>(
                          iconSize: 20,
                          underline: const SizedBox.shrink(),
                          iconEnabledColor: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          icon: const Icon(Icons.keyboard_arrow_down,
                              color: Colors.black),
                          items: [
                            DropdownMenuItem(
                                child: Row(
                              children: [
                                Icon(Icons.location_on,
                                    size: 18, color: AppColors.secondary),
                                const SizedBox(width: 5),
                                Text(HomeScreenText.dropDownMenuItemOne,
                                    style: TextStyle(
                                        color: AppColors.tertiary,
                                        fontSize: 17)),
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
                        padding: const EdgeInsets.all(10),
                        icon: Icon(Icons.notifications,
                            size: 20, color: AppColors.tertiary))
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: _searchController,
                        selectionHeightStyle: BoxHeightStyle.max,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: AppColors.tertiary, fontSize: 13),
                          prefixIcon:
                              Icon(Icons.search, color: AppColors.secondary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                    ),
                    icon: Icon(Icons.tune, size: 27, color: AppColors.primary),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
