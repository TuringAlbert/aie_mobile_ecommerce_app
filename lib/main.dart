import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_page/home_page.dart';
import 'TodoScreen.dart';
import 'TodoAddScreen.dart';
import 'navigation_bar.dart';
import 'theme.dart';

// Router
void main() async {
  // runApp(MainPage());
  runApp(const BottomNavigationBarApp());
}

