import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  'Shirts': FontAwesomeIcons.shirt,
  'Jacket': FontAwesomeIcons.vest,
  'Socks': FontAwesomeIcons.socks,
  'Gloves': FontAwesomeIcons.mitten,
};

final List<String> sizes = [
  'S',
  'M',
  'L',
  'XL',
  'XXL',
  'XXXL',
];
