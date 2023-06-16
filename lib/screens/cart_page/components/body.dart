import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_flutter1/models/Cart.dart';
import 'package:my_flutter1/models/cart_items.dart';
import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<List<CartItem>> futureCartItems;

  @override
  void initState() {
    super.initState();
    futureCartItems = CartService.getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: FutureBuilder<List<CartItem>>(
        future: futureCartItems,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CartItem> cartItems = snapshot.data!;
            return ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(cartItems[index].product.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      CartService.deleteCartItem(cartItems[index].product);
                      cartItems.removeAt(index);
                    });
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  child: CartCard(cartItem: cartItems[index], onCartUpdated: (){
                    setState((){});
                  }),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("Error loading cart items");
          }
          // While the cart items are loading
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
