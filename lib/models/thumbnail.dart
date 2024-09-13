import 'package:fashion_ecommerce_app/models/product.dart';

class Thumbnail extends Product {
  String thumbnailUrl;
  Thumbnail(
      {required super.id,
      required super.title,
      required super.discountPercentage,
      required super.rating,
      required super.price,
      required super.stock,
      required this.thumbnailUrl})
      : super.onlyId();

  factory Thumbnail.formJson(Map<String, dynamic> json) {
    return Thumbnail(
        id: json['id'],
        title: json['title'],
        discountPercentage: json["discountPercentage"]!.toDouble(),
        rating: json['rating'],
        price: json['price'],
        thumbnailUrl: json['thumbnail'],
        stock: json['stock']);
  }
}
