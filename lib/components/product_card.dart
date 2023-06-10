import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_flutter1/models/Product.dart';
import 'package:my_flutter1/screens/home_page/product_details_page/product_details_page.dart';
import 'package:my_flutter1/constants.dart';
import 'package:my_flutter1/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_flutter1/screens/home_page/components/cart_added.dart';
import 'package:my_flutter1/models/Cart.dart';


class ProductCard extends StatefulWidget {
  final double width;
  final double aspectRetio;
  final Product product;

  ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;


  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }
  Future<void> _decrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) - 1;

    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }
  @override
  void initState() {
    super.initState();
    _counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        // FutureBuilder<int>(
        //   future: _counter,
        //   builder: (BuildContext context, AsyncSnapshot<int> snapshot){
        //     switch (snapshot.connectionState) {
        //       case ConnectionState.none:
        //       case ConnectionState.waiting:
        //         return const CircularProgressIndicator();
        //       case ConnectionState.active:
        //       case ConnectionState.done:
        //         if (snapshot.hasError) {
        //           return Text('Error: ${snapshot.error}');
        //         } else {
        //           return Text(
        //             'Button tapped ${snapshot.data} time${snapshot.data == 1
        //                 ? ''
        //                 : 's'}.\n\n'
        //                 'This should persist across restarts.',
        //           );
        //         }
        //     }
        //   }),
          Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
            child: SizedBox(
              width: getProportionateScreenWidth(widget.width),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  ProductDetailsScreen.routeName,
                  arguments: ProductDetailsArguments(product: widget.product),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 1.02,
                      child: Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                        decoration: BoxDecoration(
                          color: kSecondaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Hero(
                          tag: widget.product.id.toString(),
                          child: Image.asset(widget.product.images[0]),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.product.title,
                      style: TextStyle(color: Colors.black),
                      maxLines: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${widget.product.price}",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: _incrementCounter,
                          child: Container(
                            padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                            height: getProportionateScreenWidth(28),
                            width: getProportionateScreenWidth(28),
                            decoration: BoxDecoration(
                              color: widget.product.isFavourite
                                  ? kPrimaryColor.withOpacity(0.15)
                                  : kSecondaryColor.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/Heart Icon_2.svg",
                              color: widget.product.isFavourite
                                  ? Color(0xFFFF4848)
                                  : Color(0xFFDBDEE4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}




// class ProductCard extends StatelessWidget {
//   const ProductCard({
//     Key? key,
//     this.width = 140,
//     this.aspectRetio = 1.02,
//     required this.product,
//   }) : super(key: key);
//
//   final double width, aspectRetio;
//   final Product product;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
//       child: SizedBox(
//         width: getProportionateScreenWidth(width),
//         child: GestureDetector(
//           onTap: () => Navigator.pushNamed(
//             context,
//             ProductDetailsScreen.routeName,
//             arguments: ProductDetailsArguments(product: product),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AspectRatio(
//                 aspectRatio: 1.02,
//                 child: Container(
//                   padding: EdgeInsets.all(getProportionateScreenWidth(20)),
//                   decoration: BoxDecoration(
//                     color: kSecondaryColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Hero(
//                     tag: product.id.toString(),
//                     child: Image.asset(product.images[0]),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 product.title,
//                 style: TextStyle(color: Colors.black),
//                 maxLines: 2,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "\$${product.price}",
//                     style: TextStyle(
//                       fontSize: getProportionateScreenWidth(18),
//                       fontWeight: FontWeight.w600,
//                       color: kPrimaryColor,
//                     ),
//                   ),
//                   InkWell(
//                     borderRadius: BorderRadius.circular(50),
//                     onTap: () {},
//                     child: Container(
//                       padding: EdgeInsets.all(getProportionateScreenWidth(8)),
//                       height: getProportionateScreenWidth(28),
//                       width: getProportionateScreenWidth(28),
//                       decoration: BoxDecoration(
//                         color: product.isFavourite
//                             ? kPrimaryColor.withOpacity(0.15)
//                             : kSecondaryColor.withOpacity(0.1),
//                         shape: BoxShape.circle,
//                       ),
//                       child: SvgPicture.asset(
//                         "assets/icons/Heart Icon_2.svg",
//                         color: product.isFavourite
//                             ? Color(0xFFFF4848)
//                             : Color(0xFFDBDEE4),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
