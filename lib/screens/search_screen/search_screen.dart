import 'dart:ui';
import 'package:fashion_ecommerce_app/models/thumbnail.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/flutter_toast.dart';
import 'package:fashion_ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  Future<dynamic> thumbnailsApi;
  SearchScreen({super.key, required this.thumbnailsApi});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  List<Thumbnail> _displayFilterData = [];
  List<Thumbnail> _dataHolder = [];

  Future<void> _loadData() async {
    try {
      final temp = await widget.thumbnailsApi;
      _dataHolder = List.generate(temp['limit'],
          (index) => Thumbnail.formJson(temp['products'][index]));
      setState(() {});
    } catch (e) {
      FlutterToast.showToast(message: e.toString());
    }
  }

  void _searchFunction(String enterKeyword) {
    if (enterKeyword == '') {
      _displayFilterData = [];
    } else {
      _displayFilterData = _dataHolder.where((index) {
        return index.title!.toLowerCase().contains(enterKeyword.toLowerCase());
      }).toList();
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
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
              onChanged: (text) {
                setState(() {
                  _searchFunction(text);
                });
              },
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
            Expanded(
                child: GridView.builder(
                    itemCount: _displayFilterData.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return ProductCard(
                        thumbnailUrl: _displayFilterData[index].thumbnailUrl,
                        rating: _displayFilterData[index].rating!,
                        title: _displayFilterData[index].title!,
                        productId: _displayFilterData[index].id,
                        price: _displayFilterData[index].price!,
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
