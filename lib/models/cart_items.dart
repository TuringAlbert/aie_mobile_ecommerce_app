import 'package:http/http.dart' as http;
import 'Cart.dart';
import 'dart:convert';

class CartService {
  static const baseUrl = 'http://localhost:3000';
  static const headers = {'Content-Type': 'application/json'};

  // GET /cartItems
  static Future<List<CartItem>> getCartItems() async {
    final response = await http.get(Uri.parse('$baseUrl/cartItems'));

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List;
      return jsonList.map((json) => CartItem.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cart items');
    }
  }

  // POST /cartItems
  static Future<CartItem> addCartItem(CartItem item) async {
    final jsonBody = jsonEncode(item.toJson());

    final response = await http.post(
      Uri.parse('$baseUrl/cartItems'),
      headers: headers,
      body: jsonBody,
    );

    if (response.statusCode == 201) {
      final json = jsonDecode(response.body);
      return CartItem.fromJson(json);
    } else {
      throw Exception('Failed to add cart item');
    }
  }

  // PUT /cartItems/:product
  static Future<CartItem> updateCartItem(CartItem item) async {
    final jsonBody = jsonEncode(item.toJson());

    final response = await http.put(
      Uri.parse('$baseUrl/cartItems/${item.product}'),
      headers: headers,
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return CartItem.fromJson(json);
    } else {
      throw Exception('Failed to update cart item');
    }
  }

  // DELETE /cartItems/:product
  static Future<void> deleteCartItem(int productId) async {
    final response = await http.delete(Uri.parse('$baseUrl/cartItems/$productId'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete cart item');
    }
  }

  // GET /products/:id
  static Future<Map<String, dynamic>> getProduct(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/products/$id'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json;
    } else {
      throw Exception('Failed to load product');
    }
  }
}
