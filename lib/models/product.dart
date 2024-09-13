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
