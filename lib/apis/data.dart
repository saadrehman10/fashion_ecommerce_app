import 'package:flutter/material.dart';

final List<dynamic> slider = [
  {
    "title": "New Collection",
    "subtitle": "Discount 50% for the first transaction",
    "imgPath": 'assets/images/pictures/test_img.png'
  },
  {
    "title": "Summer Vibes",
    "subtitle": "Feel the heat with 30% off selected items",
    "imgPath": 'assets/images/pictures/test_img.png'
  },
  {
    "title": "Winter Wonders",
    "subtitle": "Cozy up with our new winter collection",
    "imgPath": 'assets/images/pictures/test_img.png'
  },
  {
    "title": "Spring Refresh",
    "subtitle": "Bring life to your wardrobe this spring",
    "imgPath": 'assets/images/pictures/test_img.png'
  },
  {
    "title": "Autumn Essentials",
    "subtitle": "Get ready for fall with our exclusive deals",
    "imgPath": 'assets/images/pictures/test_img.png'
  },
];

final Map<String, IconData> categoryIcons = {
  'beauty': Icons.face,
  'fragrances': Icons.filter_frames,
  'furniture': Icons.hotel,
  'groceries': Icons.local_grocery_store,
};

final List<String> productSizes = [
  'S',
  'M',
  'L',
  'XL',
  'XXL',
  'XXXL',
];

final List<Color> productColors = [
  const Color(0xFFd4a88e), // Deep Blue
  const Color(0xFF79665c), // Bright Red
  const Color(0xFFd99567), // Vibrant Green
  const Color(0xFFb9773b), // Sunset Orange
  const Color(0xFF252525), // Purple
  const Color(0xFFebe1da),
  const Color(0xFF81766f), // Teal
];

final List<Map<String, dynamic>> profilesData = [
  {'leadingIcon': Icons.person, 'title': 'Your Profile'},
  {'leadingIcon': Icons.payment, 'title': 'Payment Methods'},
  {'leadingIcon': Icons.shopping_bag, 'title': 'My Orders'},
  {'leadingIcon': Icons.settings, 'title': 'Settings'},
  {'leadingIcon': Icons.help_outline, 'title': 'Help Center'},
  {'leadingIcon': Icons.privacy_tip, 'title': 'Privacy Policy'},
  {'leadingIcon': Icons.people, 'title': 'Invite Friends'},
  {'leadingIcon': Icons.logout, 'title': 'Log out'},
];
