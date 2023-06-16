import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_flutter1/models/Cart.dart';
import 'package:my_flutter1/models/cart_items.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';
import 'package:my_flutter1/size_config.dart';
import 'package:my_flutter1/navigation_bar.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [];

  @override
  void initState() {
    super.initState();
    fetchCartItems();
  }

  fetchCartItems() async {
    try {
      cartItems = await CartService.getCartItems();
      setState(() {}); // Refresh the UI after loading the cart items
    } catch (e) {
      print("Error fetching cart items: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(cartItems: cartItems),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${cartItems.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
