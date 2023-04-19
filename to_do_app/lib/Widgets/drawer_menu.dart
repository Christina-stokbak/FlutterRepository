import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Utils/color_themes.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  void openPage(context, String page) {
    Navigator.pushNamed(context, '/$page');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            constraints: BoxConstraints(
              maxHeight: 75
            ),
            child: DrawerHeader(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: ThemeColors.appBarColor),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.task),
            title: Text("Opgaver"),
            onTap: () {
              openPage(context, "ToDoPage");
            },
          ),
          ListTile(
            leading: Icon(Icons.cloud),
            title: Text("Vejr"),
            onTap: () {
              openPage(context, "WeatherPage");
            },
          )
        ],
      ),
    );
  }
}
