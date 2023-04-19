import 'package:bottom_menu_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'Widgets/my_bottomNavigatorBar.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key, required this.navigationBarSelectedIndex});

  final int navigationBarSelectedIndex;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigatorBar(selectedIndex: widget.navigationBarSelectedIndex),
      body: const Center(child: Text("List")),
    );
  }
}