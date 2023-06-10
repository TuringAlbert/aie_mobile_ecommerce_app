import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_flutter1/screens/home_page/components/home_header.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../size_config.dart';
import 'package:my_flutter1/screens/home_page/components/past_header.dart';
import 'package:my_flutter1/screens/home_page/components/cart_added.dart';
import 'package:my_flutter1/components/product_card.dart';
import 'package:my_flutter1/models/Product.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: getProportionateScreenHeight(20)),
              HomeHeader(),
              PastHeader(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      demoProducts.length,
                          (index) {
                        if (demoProducts[index].isPopular)
                          return ProductCard(product: demoProducts[index]);
                        return SizedBox
                            .shrink(); // here by default width and height is 0
                      },
                    ),
                    SizedBox(width: getProportionateScreenWidth(20)),
                    CartAdded()
                  ],
                ),
              ),

            ],
          ),
        ),
    );
  }
}
