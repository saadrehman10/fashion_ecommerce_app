import 'dart:ui';

import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchFocus.requestFocus();
  }

  @override
  void dispose() {
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          SearchScreenText.pageTitle,
          style: TextStyle(
            color: AppColors.tertiary,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              focusNode: _searchFocus,
              onTapOutside: (event) {
                setState(() {
                  _searchFocus.unfocus();
                });
              },
              onChanged: (text) {},
              selectionHeightStyle: BoxHeightStyle.max,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                    color: AppColors.secondary,
                    style: BorderStyle.solid,
                    width: 1.5,
                  ),
                ),
                hintText: AppTexts.search,
                hintStyle: TextStyle(
                    color: AppColors.textColorSubtitles,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
                prefixIcon:
                    Icon(Iconsax.search_normal_14, color: AppColors.secondary),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      strokeAlign: 1, color: AppColors.textColorSubtitles),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // GridView.builder(
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2),
            //     itemBuilder: ())
          ],
        ),
      ),
    );
  }
}
