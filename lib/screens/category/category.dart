import 'package:fashion_ecommerce_app/business_logics/category_logic.dart';
import 'package:fashion_ecommerce_app/models/thumbnail.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            category.capitalize,
            style: TextStyle(
              color: AppColors.tertiary,
              fontSize: 21,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        body: FutureBuilder(
          future: CategoryLogic.getCategoryData(category: category),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      strokeAlign: 3,
                    ),
                    SizedBox(height: 20),
                    Text('Loading ...'),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              debugPrint(snapshot.error.toString());
              return Column(
                children: [
                  Text(snapshot.error.toString()),
                  Center(
                    child: IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: Icon(Icons.refresh, size: 20, color: AppColors.secondary),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasData) {
              List<Thumbnail> filteredData = List<Thumbnail>.generate(
                  snapshot.data!['products'].length,
                  (index) => Thumbnail.formJson(snapshot.data!['products'][index]));

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                    itemCount: filteredData.length,
                    shrinkWrap: true,
                    //  physics: NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return ProductCard(
                        thumbnailUrl: filteredData[index].thumbnailUrl,
                        rating: filteredData[index].rating!,
                        title: filteredData[index].title!,
                        productId: filteredData[index].id,
                        price: filteredData[index].price!,
                      );
                    }),
              );
            } else {
              return const Center(child: Text('No text found'));
            }
          },
        ));
  }

  void setState(Null Function() param0) {}
}
