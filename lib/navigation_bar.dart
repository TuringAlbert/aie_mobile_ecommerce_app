import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_page/home_page.dart';
import 'TodoScreen.dart';
import 'TodoAddScreen.dart';
import 'package:my_flutter1/screens/cart_page/cart_page.dart';
import 'package:my_flutter1/screens/my_profile_page/my_profile_page.dart';
import 'package:my_flutter1/enums.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_flutter1/constants.dart';


class BottomNavigationBarApp extends StatelessWidget {
  const BottomNavigationBarApp({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Colors.grey;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: MenuState.home == selectedMenu
                      ? Colors.blue
                      : inActiveIconColor,
                ),
                onPressed: () =>
                  Navigator.pushNamed(context, HomeScreen.routeName),
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Heart Icon.svg",
                color: MenuState.cart == selectedMenu
                    ? Colors.blue
                    : inActiveIconColor,
              ),
              onPressed: ()  =>
                  Navigator.pushNamed(context, CartScreen.routeName),
            ),
            IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile == selectedMenu
                      ? Colors.blue
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, ProfileScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
// class BottomNavigationBarMain extends StatefulWidget {
//   const BottomNavigationBarMain({super.key});
//   @override
//   State<BottomNavigationBarMain> createState() =>
//       _BottomNavigationBarMainState();
// }
// class _BottomNavigationBarMainState
//     extends State<BottomNavigationBarMain> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//   TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static List<Widget> _widgetOptions = <Widget>[
//     // HomeScreen(),
//     CartScreen(),
//     ProfileScreen(),
//     TodoListScreen(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Yonsei Shop'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: "home"
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.add_shopping_cart),
//               label: "cart"
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: "my profile"
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: "my profile"
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blueAccent[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }


