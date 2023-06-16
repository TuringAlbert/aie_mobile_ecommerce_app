import 'package:flutter/material.dart';

import 'Product.dart';

class CartItem {
  final int id;
  final int product;
  final int count;

  CartItem({
    required this.id,
    required this.product,
    required this.count,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      product: json['product'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product,
      'count': count,
    };
  }
}