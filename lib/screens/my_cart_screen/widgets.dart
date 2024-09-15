import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomListTile extends StatefulWidget {
  final String thumbnailUrl, title;
  final num price;

  const CustomListTile({
    super.key,
    required this.thumbnailUrl,
    required this.title,
    required this.price,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenHeight < screenWidth) {
      screenWidth *= 1.45;
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                  height: screenHeight * .12,
                  width: screenHeight * .12,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    widget.thumbnailUrl,
                    errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.error,
                        size: 25,
                        color: AppColors.textColorSubtitles),
                  )),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: AppColors.tertiary,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Size: XL',
                    style: TextStyle(
                      color: AppColors.textColorSubtitles,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: screenWidth * .55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${widget.price}',
                          style: TextStyle(
                            color: AppColors.tertiary,
                            fontSize: 15,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: AppColors.textColorSubtitles
                                      .withOpacity(.20),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Center(
                                  child: Icon(FontAwesomeIcons.minus,
                                      color: Colors.black, size: 13),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(quantity.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.tertiary,
                                )),
                            const SizedBox(width: 5),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: AppColors.secondary,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Center(
                                  child: Icon(Icons.add,
                                      color: Colors.white, size: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          width: screenWidth * .9,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ],
    );
  }
}
