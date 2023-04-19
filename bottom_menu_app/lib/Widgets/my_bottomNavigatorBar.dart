import 'package:bottom_menu_app/list_page.dart';
import 'package:flutter/material.dart';

import '../Utils/routes.dart';

class MyBottomNavigatorBar extends StatefulWidget {
  MyBottomNavigatorBar({
    super.key, required this.selectedIndex
  });

  int selectedIndex;

  @override
  State<MyBottomNavigatorBar> createState() => _MyBottomNavigatorBarState();
}

class _MyBottomNavigatorBarState extends State<MyBottomNavigatorBar> {

    final routes = Routes.routeNames;

    void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
      Navigator.pushReplacementNamed(context, '/${routes[widget.selectedIndex]}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: "List"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "People"
        )
      ],
      onTap: _onItemTapped,
      currentIndex: widget.selectedIndex,
    );
  }
}