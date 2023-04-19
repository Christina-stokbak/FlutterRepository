import 'package:flutter/material.dart';

import 'Utils/color_themes.dart';
import 'Widgets/my_bottomNavigatorBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.navigationBarSelectedIndex});

  final int navigationBarSelectedIndex;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorTheme.AppBarColor,
        title: const Text("Bottom Menu app"),
      ),
      bottomNavigationBar: MyBottomNavigatorBar(selectedIndex: widget.navigationBarSelectedIndex),
      body: const Center(child: Text("Home")),
    );
  }
}

