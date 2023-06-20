import 'package:flutter/material.dart';
import 'package:my_flutter1/models/Cart.dart';
import 'package:my_flutter1/models/cart_items.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatefulWidget {
  final CartItem cartItem;
  final VoidCallback onCartUpdated;

  const CartCard({Key? key, required this.cartItem, required this.onCartUpdated}) : super(key: key);

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int ?count;

  @override
  void initState() {
    super.initState();
    count = widget.cartItem.count;
  }

  Future<void> updateCount(int increment) async {
    int newCount = (count ?? 0) + increment;
    
    // Ensure the newCount is non-negative
    if (newCount < 0) {
      return;
    }

    try {
      await CartService.updateCartItem(
        CartItem(
          id: widget.cartItem.id,
          product: widget.cartItem.product,
          count: newCount,
        ),
      );
      setState(() {
        count = newCount;
      });
      widget.onCartUpdated();
    } catch (e) {
      print('Failed to update count: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: CartService.getProduct(widget.cartItem.product),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Row(
            children: [
              SizedBox(
                width: 88,
                child: AspectRatio(
                  aspectRatio: 0.88,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(snapshot.data!['image']),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snapshot.data!['name'],
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      maxLines: 2,
                    ),
                    SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        text: "\￦${snapshot.data!['cost']}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: kPrimaryColor),
                        children: [
                          TextSpan(
                              text: " x$count",
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              updateCount(-1);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              updateCount(1);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("Error loading product details");
        }

        // While the product details are loading
        return CircularProgressIndicator();
      },
    );
  }
}
