import 'package:flutter/material.dart';

import 'Product.dart';

class Cart {
  final Product product;
  final int numOfItem;

  Cart({required this.product, required this.numOfItem});
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(product: demoProducts[0], numOfItem: 4),
  Cart(product: demoProducts[1], numOfItem: 1),
  Cart(product: demoProducts[3], numOfItem: 1),
];

class cartItem {
  final int product; // Todo 항목의 고유 ID
  final int? count; // Todo 항목의 제목

  // 생성자
  cartItem({
    required this.product,
    required this.count,
  });

  // JSON에서 Todo 객체를 만드는 생성자
  factory cartItem.fromJson(Map<String, dynamic> json) {
    return cartItem(
      product: json['product'] as int,
      count: json['count'] as int?,
    );
  }

  // Todo 객체를 JSON으로 변환하는 메서드
  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'count': count,
    };
  }
}