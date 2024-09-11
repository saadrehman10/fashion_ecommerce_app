class Product {
  final String? title, description, category, brand;
  final int id;
  final int? stock;
  final double? price, rating, discountPercentage;
  final List? imageUrl;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.brand,
    required this.discountPercentage,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.stock,
  });
  const Product.onlyId({
    required this.id,
    this.title,
    this.discountPercentage,
    this.price,
    this.rating,
    this.description,
    this.category,
    this.brand,
    this.imageUrl,
    this.stock,
  });

  factory Product.formJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      brand: json['brand'],
      discountPercentage: json['discountPercentage'].toDouble(),
      imageUrl: json['images'],
      price: json['price'],
      rating: json['rating'],
      stock: json['stock'],
    );
  }
}

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
