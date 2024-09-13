import 'package:fashion_ecommerce_app/models/product.dart';

class ProductReview extends Product {
  final double reviewerRating;
  final String reviewerComment, commentDate, reviewerName, reviewerEmail;

  ProductReview({
    required super.id,
    required this.reviewerRating,
    required this.commentDate,
    required this.reviewerComment,
    required this.reviewerEmail,
    required this.reviewerName,
  }) : super.onlyId();

  factory ProductReview.fromJson(Map<String, dynamic> map) {
    return ProductReview(
      id: map['id'],
      reviewerRating: map['reviewerRating'],
      commentDate: map['commentDate'],
      reviewerComment: map['reviewerComment'],
      reviewerEmail: map['reviewerEmail'],
      reviewerName: map['reviewerName'],
    );
  }
}
