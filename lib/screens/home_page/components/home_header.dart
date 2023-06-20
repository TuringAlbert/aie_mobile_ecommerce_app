import 'package:flutter/material.dart';
import 'package:my_flutter1/screens/cart_page/cart_page.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';
import 'package:my_flutter1/models/Product.dart';

class HomeHeader extends StatefulWidget {
  final int numOfItem;

  const HomeHeader({
    Key? key,
    this.numOfItem = 1, // You can set the default value here
  }) : super(key: key);

  @override
  _HomeHeaderState createState() => _HomeHeaderState(numOfItem: this.numOfItem);
}

class _HomeHeaderState extends State<HomeHeader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int numOfItem;

  _HomeHeaderState({required this.numOfItem});

  @override
  void initState() {
    super.initState();

  _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );

  _animation = Tween<double>(begin: -0.2, end: 0.2).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    ),
  );

  // Add this listener to the animation controller
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 0), () {
          if (mounted && numOfItem > 0) { 
            _controller.reverse();
          }
        });
      } else if (status == AnimationStatus.dismissed) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted && numOfItem > 0) { 
            _controller.forward();
          }
        });
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchBarApp(product: demoProducts),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: numOfItem,
            press: () {},
            animation: _animation,
          ),
        ],
      ),
    );
  }
}

// IconBtnWithCounter Widget

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key,
    required this.svgSrc,
    this.numOfitem = 0,
    required this.press,
    required this.animation,
  }) : super(key: key);

  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: animation.value,
                  child: SvgPicture.asset(svgSrc),
                );
              },
            ),
          ),
          if (numOfitem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: TextStyle(
                      fontSize: 10,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}