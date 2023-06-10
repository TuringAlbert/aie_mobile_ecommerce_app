import 'package:flutter/material.dart';
import 'package:my_flutter1/components/default_button.dart';
import 'package:my_flutter1/models/Product.dart';
import 'package:my_flutter1/size_config.dart';
import 'package:my_flutter1/screens/home_page/components/cart_added.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter1/components/rounded_icon_btn.dart';
import 'package:my_flutter1/models/Product.dart';
import 'package:my_flutter1/constants.dart';
import 'package:my_flutter1/size_config.dart';
import 'package:my_flutter1/screens/home_page/product_details_page/product_details_page.dart';

class Body extends StatefulWidget {
  final Product product;
  const Body({Key? key, required this.product}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body>{
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
  Future<void> _deincrementCounter() async {
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


  @override
  Widget build(BuildContext context) {
    int selectedColor = 3;
    return ListView(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              // CartAdded(),

              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                      child: Row(
                        children: [
                          ...List.generate(
                            widget.product.colors.length,
                                (index) => ColorDot(
                              color: widget.product.colors[index],
                              isSelected: index == selectedColor,
                            ),
                          ),
                          Spacer(),
                          RoundedIconBtn(
                            icon: Icons.remove,
                            press: _deincrementCounter,
                          ),
                          SizedBox(width: getProportionateScreenWidth(20)),
                          RoundedIconBtn(
                            icon: Icons.add,
                            showShadow: true,
                            press: _incrementCounter,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    FutureBuilder<int>(
                        future: _counter,
                        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                              return const CircularProgressIndicator();
                            case ConnectionState.active:
                            case ConnectionState.done:
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return Container(
                                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                                  decoration: BoxDecoration(
                                    color: kSecondaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    '${snapshot.data}개의 상품을 담았습니다.\n상품은 페이지를 나가도 저장됩니다 :)',
                                    style : TextStyle(
                                    fontSize: getProportionateScreenWidth(18),
                                    fontWeight: FontWeight.w600,
                                    color: kPrimaryColor,
                                    ),
                                  ),
                                );
                              }
                          }
                        }),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "결제하기",
                          press: _incrementCounter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ColorDots extends StatelessWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 3;
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
            product.colors.length,
                (index) => ColorDot(
              color: product.colors[index],
              isSelected: index == selectedColor,
            ),
          ),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {

            },
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {

            },
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
        Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}