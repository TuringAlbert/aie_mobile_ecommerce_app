import 'package:flutter/material.dart';
import 'components/body.dart';
import 'package:my_flutter1/navigation_bar.dart';
import 'package:my_flutter1/enums.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: BottomNavigationBarApp(selectedMenu: MenuState.profile),
    );
  }
}
