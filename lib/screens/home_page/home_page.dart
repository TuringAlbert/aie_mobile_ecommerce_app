import 'package:flutter/material.dart';
import 'package:my_flutter1/navigation_bar.dart';
import 'package:my_flutter1/screens/home_page/components/body.dart';
import 'package:my_flutter1/enums.dart';
import 'package:my_flutter1/screens/home_page/components/cart_added.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';



class HomeScreen extends StatelessWidget{
  static String routeName = "/home";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavigationBarApp(selectedMenu: MenuState.home),
    );
  }
}

