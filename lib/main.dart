import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_page/home_page.dart';
import 'TodoScreen.dart';
import 'TodoAddScreen.dart';
import 'navigation_bar.dart';
import 'theme.dart';
import 'package:my_flutter1/size_config.dart';
import 'package:my_flutter1/screens/home_page/home_page.dart';
import 'package:my_flutter1/routes.dart';

// Router
void main() async {
  // runApp(MainPage());
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Yonsei E-Commerce",
      home: HomeScreen(),
      routes: routes,
    );
  }
}