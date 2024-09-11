import 'dart:ui';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/data.dart';
import 'package:fashion_ecommerce_app/utils/images.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/product_card/product_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_animation/onboarding_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final PageController _pageController = PageController();

  final List<dynamic> slider = [
    {
      "title": "New Collection",
      "subtitle": "Discount 50% for the first transaction",
      "imgPath": 'assets/images/pictures/test_img.png'
    },
    {
      "title": "Summer Vibes",
      "subtitle": "Feel the heat with 30% off selected items",
      "imgPath": 'assets/images/pictures/test_img.png'
    },
    {
      "title": "Winter Wonders",
      "subtitle": "Cozy up with our new winter collection",
      "imgPath": 'assets/images/pictures/test_img.png'
    },
    {
      "title": "Spring Refresh",
      "subtitle": "Bring life to your wardrobe this spring",
      "imgPath": 'assets/images/pictures/test_img.png'
    },
    {
      "title": "Autumn Essentials",
      "subtitle": "Get ready for fall with our exclusive deals",
      "imgPath": 'assets/images/pictures/test_img.png'
    },
  ];

  final Map<String, IconData> categoryIcons = {
    'Shirts': FontAwesomeIcons.shirt,
    'Jacket': FontAwesomeIcons.vest,
    'Socks': FontAwesomeIcons.socks,
    'Gloves': FontAwesomeIcons.mitten,
  };

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
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
                        onPressed: () {
                          setState(() {});
                        },
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
              const SizedBox(width: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      SizedBox(
                        height: screenHeight * .23,
                        child: PageView.builder(
                            controller: _pageController,
                            itemCount: slider.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(10),
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                width: double.infinity,
                                height: double.maxFinite,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.background,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(slider[index]['title'],
                                              style: TextStyle(
                                                color: AppColors.tertiary,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                              )),
                                          Text(slider[index]['subtitle'],
                                              style: TextStyle(
                                                color: AppColors
                                                    .textColorSubtitles,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 18,
                                              )),
                                          const SizedBox(height: 10),
                                          ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.secondary,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                              ),
                                              child: Text(
                                                ButtonText.shopNow,
                                                style: TextStyle(
                                                  color: AppColors.primary,
                                                  fontSize: 18,
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        child: Image.asset(
                                            slider[index]['imgPath']))
                                  ],
                                ),
                              );
                            }),
                      ),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: slider.length,
                        axisDirection: Axis.horizontal,
                        effect: JumpingDotEffect(
                          activeDotColor: AppColors.secondary,
                          dotHeight: 8,
                          dotWidth: 8,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(HomeScreenText.headingCategory,
                              style: TextStyle(
                                  color: AppColors.tertiary,
                                  fontSize: 30,
                                  fontWeight: FontWeight.normal)),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              ButtonText.seeAll,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: List<Widget>.generate(
                          categoryIcons.length,
                          (index) {
                            return Expanded(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      radius: 32,
                                      backgroundColor: AppColors.background,
                                      child: Icon(
                                          categoryIcons.values.toList()[index],
                                          color: AppColors.secondary,
                                          size: 30),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(categoryIcons.keys.toList()[index],
                                      style: TextStyle(
                                        color: AppColors.tertiary,
                                        fontSize: 15,
                                      ))
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            HomeScreenText.headingFlashSale,
                            style: TextStyle(
                                color: AppColors.tertiary,
                                fontSize: 30,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                              child: Row(
                            children: [
                              Text(HomeScreenText.closingIn,
                                  style: TextStyle(
                                      color: AppColors.textColorSubtitles,
                                      fontSize: 15)),
                            ],
                          ))
                        ],
                      ),
                      SizedBox(
                        height: screenHeight,
                         
                        child: GridView.builder(
                           physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return const Placeholder();
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// GridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2, //
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10,
//                     ),
//                     itemBuilder: (context, index) {
//                       return const ProductCard(
//                         price: 22.3,
//                         thumbnailUrl:
//                             'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png',
//                         discountPercentage: 7.17,
//                         rating: 4.94,
//                         stock: 30,
//                         title: 'Essence ',
//                         productId: 3,
//                       );
//                     })
