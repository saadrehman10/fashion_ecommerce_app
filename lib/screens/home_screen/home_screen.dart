import 'dart:ui';
import 'package:fashion_ecommerce_app/apis/product_api.dart';
import 'package:fashion_ecommerce_app/models/thumbnail.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_animation/onboarding_animation.dart';
import 'package:fashion_ecommerce_app/apis/data.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  Future<dynamic> thumbnailsApi;
  HomeScreen({super.key, required this.thumbnailsApi});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenHeight < screenWidth) {
      screenWidth *= 1.45;
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
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
                      FutureBuilder(
                        future: widget.thumbnailsApi,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Padding(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 4,
                                    width: 4,
                                    child: CircularProgressIndicator(
                                      strokeAlign: 3,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Text('Loading Products ... '),
                                ],
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Column(
                              children: [
                                Text(snapshot.error.toString()),
                                Center(
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.thumbnailsApi =
                                            ProductApi.allProduct();
                                      });
                                    },
                                    icon: Icon(Icons.refresh,
                                        size: 20, color: AppColors.secondary),
                                  ),
                                ),
                              ],
                            );
                          } else if (snapshot.hasData) {
                            List<Thumbnail> filterData =
                                List<Thumbnail>.generate(snapshot.data['limit'],
                                    (index) {
                              return Thumbnail.formJson(
                                  snapshot.data['products'][index]);
                            });
                            return GridView.builder(
                                itemCount: snapshot.data['limit'],
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                //  physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index) {
                                  return ProductCard(
                                    thumbnailUrl:
                                        filterData[index].thumbnailUrl,
                                    rating: filterData[index].rating!,
                                    title: filterData[index].title!,
                                    productId: filterData[index].id,
                                    price: filterData[index].price!,
                                   
                                  );
                                });
                          } else {
                            return const Center(child: Text('No text found'));
                          }
                        },
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
