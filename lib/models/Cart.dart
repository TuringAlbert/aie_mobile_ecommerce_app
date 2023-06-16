import 'package:flutter/material.dart';

import 'Product.dart';

class CartItem {
  final int product; // product ID
  final int count; // quantity

  CartItem({
    required this.product,
    required this.count,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: json['product'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'count': count,
    };
  }
}
