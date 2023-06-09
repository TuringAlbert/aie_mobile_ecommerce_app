import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_page/home_page.dart';
import 'TodoScreen.dart';
import 'TodoAddScreen.dart';
import 'package:my_flutter1/screens/cart_page/cart_page.dart';
import 'package:my_flutter1/size_config.dart';

class BottomNavigationBarApp extends StatelessWidget {
  const BottomNavigationBarApp({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarMain(),
    );
  }
}

class BottomNavigationBarMain extends StatefulWidget {
  const BottomNavigationBarMain({super.key});
  @override
  State<BottomNavigationBarMain> createState() =>
      _BottomNavigationBarMainState();
}
class _BottomNavigationBarMainState
    extends State<BottomNavigationBarMain> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    CartScreen(),
    TodoListScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yonsei Shop'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: "cart"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "my profile"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "my profile"
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent[800],
        onTap: _onItemTapped,
      ),
    );
  }
}


