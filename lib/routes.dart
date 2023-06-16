import 'package:flutter/widgets.dart';
import 'package:my_flutter1/screens/home_page/home_page.dart';
import 'package:my_flutter1/screens/cart_page/cart_page.dart';
import 'package:my_flutter1/screens/my_profile_page/my_profile_page.dart';
import 'package:my_flutter1/screens/home_page/product_details_page/product_details_page.dart';
import 'package:my_flutter1/screens/my_profile_page/components/notification_switch.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
  NotificationSwitchScreen.routeName : (context) => NotificationSwitch(),

};
