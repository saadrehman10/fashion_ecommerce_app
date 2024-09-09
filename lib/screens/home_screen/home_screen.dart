import 'dart:ui';
import 'package:fashion_ecommerce_app/apis/slider_api.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/data.dart';
import 'package:fashion_ecommerce_app/utils/images.dart';
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
  late Future<dynamic> futureData;
  @override
  void initState() {
    super.initState();
    futureData = SliderApi.sliderData();
  }

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
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: CarouselSlider.builder(
                          options: CarouselOptions(
                            height: screenHeight * .2,
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
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: AppColors.background,
                                  borderRadius: BorderRadius.circular(20)),
                              child: FutureBuilder(
                                future: futureData,
                                builder: (BuildContext context,
                                    AsyncSnapshot<dynamic> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (snapshot.hasError) {
                                    setState(() {
                                      futureData = SliderApi.sliderData();
                                    });
                                    return Text(snapshot.error.toString());
                                  } else if (snapshot.hasData) {
                                    final data = snapshot.data!["slider"];
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              data[itemIndex]['title'],
                                              style: TextStyle(
                                                color: AppColors.tertiary,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              data[itemIndex]['subtitle'],
                                              style: TextStyle(
                                                color: AppColors
                                                    .textColorSubtitles,
                                                fontSize: 10,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.secondary,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Text(ButtonText.shopNow,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color:
                                                          AppColors.primary)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: data[itemIndex]['imgPath'] ==
                                                  null
                                              ? Image.asset(AppImages
                                                  .welcomeScreenImgThree)
                                              : Image.network(data['imgPath']),
                                        )
                                      ],
                                    );
                                  } else {
                                    return const Placeholder();
                                  }
                                },
                              ),
                            );
                          }),
                    ),
                    const SizedBox(height: 10),
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
                    SizedBox(
                      height: screenHeight * .08,
                      child: ListView.builder(
                          itemCount: AppData.categoryIcons.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: AppColors.background,
                                child: Icon(AppData.categoryIcons[index],
                                    color: AppColors.secondary),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(height: 20),
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
                    )
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
