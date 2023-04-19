import 'package:bottom_menu_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'Widgets/my_bottomNavigatorBar.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({super.key, required this.navigationBarSelectedIndex});

  final int navigationBarSelectedIndex;

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigatorBar(selectedIndex: widget.navigationBarSelectedIndex),
      body: const Center(child: Text("People")),
    );
  }
}