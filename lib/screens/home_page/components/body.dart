import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../size_config.dart';
import 'package:my_flutter1/screens/home_page/components/home_header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              HomeHeader(),
            ],
          ),
        ),
    );
  }
}