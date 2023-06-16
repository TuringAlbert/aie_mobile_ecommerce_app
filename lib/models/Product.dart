import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// class yeet {
//   List<dynamic> data = [];
//   static const baseUrl = 'http://localhost:3000'; // Change this to your server's address

//   @override
//   void initState() {
//     super.initState();
//     fetchData().then((jsonData) {
//       setState(() {
//         data = jsonData;
//       });
//     });
//   }

//   static Future<List<dynamic>> fetchData() async {
//     final response = await http.get(Uri.parse('$baseUrl/products'));

//     if (response.statusCode == 200) {
//       List<dynamic> jsonData = json.decode(response.body);
//       return jsonData;
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }
                          // Image.asset(item['image'], width: 200, height: 200),
                          // Text(item['name']),
                          // Text(item['cost'].toString()),

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products
List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/badge.jpeg",
      // "assets/images/ps4_console_white_2.png",
      // "assets/images/ps4_console_white_3.png",
      // "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Yonsei Badge",
    price: 5000,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/bag.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Yonsei Bag",
    price: 50000,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/bear.jpeg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Yonsei Bear",
    price: 10000,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/folder.jpeg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Yonsei Folder",
    price: 5000,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Yonsei Flexible Folder";
