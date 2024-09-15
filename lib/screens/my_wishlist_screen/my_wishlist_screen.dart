import 'package:fashion_ecommerce_app/apis/product_api.dart';
import 'package:fashion_ecommerce_app/models/thumbnail.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyWishlistScreen extends StatefulWidget {
  Future<dynamic> thumbnailsApi;
  MyWishlistScreen({super.key, required this.thumbnailsApi});

  @override
  State<MyWishlistScreen> createState() => _MyWishlistScreenState();
}

class _MyWishlistScreenState extends State<MyWishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          MyWishListScreenText.pageTitle,
          style: TextStyle(
            color: AppColors.tertiary,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: widget.thumbnailsApi,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
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
                        widget.thumbnailsApi = ProductApi.allProduct();
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
                List<Thumbnail>.generate(snapshot.data['limit'], (index) {
              return Thumbnail.formJson(snapshot.data['products'][index]);
            });
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                  itemCount: snapshot.data['limit'],
                  shrinkWrap: true,
                  //  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(
                        thumbnailUrl: filterData[index].thumbnailUrl,
                        rating: filterData[index].rating!,
                        title: filterData[index].title!,
                        productId: filterData[index].id,
                        price: filterData[index].price!);
                  }),
            );
          } else {
            return const Center(child: Text('No text found'));
          }
        },
      ),
    );
  }
}
