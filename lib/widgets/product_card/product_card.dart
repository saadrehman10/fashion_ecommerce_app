import 'package:fashion_ecommerce_app/apis/product_api.dart';
import 'package:flutter/material.dart';
import './product.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProductApi.apiResponse(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text('Loading Products...',
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w100,
                    )),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          Future.delayed(const Duration(seconds: 5), () => setState(() {}));
          return Center(
            child: Text('Error: \n${snapshot.error}\n'),
          );
        } else if (snapshot.hasData) {
          List<Thumbnail> filteredData = List<Thumbnail>.generate(
              snapshot.data!['products'].length, (index) {
            return Thumbnail.formJson(snapshot.data!['products'][index]);
          });
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: snapshot.data!['products'].length,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(56, 160, 160, 160),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Image.network(
                                  filteredData[index].thumbnailUrl,
                                  fit: BoxFit.fitWidth,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(4)),
                                  padding:
                                      const EdgeInsets.fromLTRB(6, 5, 6, 5),
                                  child: Text(
                                      (filteredData[index].discountPercentage)
                                              .toString() +
                                          r' %',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(
                                filteredData[index].title!,
                                overflow: TextOverflow.fade,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(filteredData[index].rating.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    )),
                                Row(
                                  children: List.generate(
                                      5,
                                      (index) => const Icon(Icons.star,
                                          color: Colors.yellow, size: 20)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Item left : ${filteredData[index].stock!}',
                                style: const TextStyle(
                                  fontSize: 13,
                                )),
                          ]),
                    ),
                  );
                }),
          );
        } else {
          return const Center(
            child: Text(
              'No data found',
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            ),
          );
        }
      },
    );
  }
}
