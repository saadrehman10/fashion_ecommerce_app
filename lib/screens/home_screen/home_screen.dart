import 'dart:ui';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                              color: AppColors.secondary,
                              style: BorderStyle.solid,
                              width: 1.5,
                            ),
                          ),
                          hintText: AppTexts.search,
                          hintStyle: TextStyle(
                              color: AppColors.tertiary, fontSize: 16),
                          prefixIcon:
                              Icon(Icons.search, color: AppColors.secondary),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                strokeAlign: 1,
                                color: AppColors.textColorSubtitles),
                            borderRadius: BorderRadius.circular(50),
                          ),
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
              ),
              const SizedBox(width: 10),
              SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: CarouselSlider.builder(
                        options: CarouselOptions(
                          height: 400,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          pageSnapping: false,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          // onPageChanged: callbackFunction,
                          scrollDirection: Axis.horizontal,
                          
                        ),
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          return Container(
                            color: Colors.pink[200],
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text('$itemIndex'),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
