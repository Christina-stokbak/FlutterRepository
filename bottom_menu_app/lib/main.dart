import 'package:bottom_menu_app/Utils/color_themes.dart';
import 'package:bottom_menu_app/people_page.dart';
import 'package:flutter/material.dart';

import 'Utils/routes.dart';
import 'home_page.dart';
import 'list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(navigationBarSelectedIndex: 0,),
      routes: {"/${Routes.routeNames[0]}": (context) => HomePage(navigationBarSelectedIndex: 0,),
      "/${Routes.routeNames[1]}": (context) => ListPage(navigationBarSelectedIndex: 1),
      "/${Routes.routeNames[2]}": (context) => PeoplePage(navigationBarSelectedIndex: 2)},
    );
  }
}


