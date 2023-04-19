import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Utils/color_themes.dart';

class MySwitch extends StatefulWidget {
  MySwitch({super.key, required this.value, required this.onChanged});

  bool value;
  Function (bool value) onChanged;

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: ThemeColors.appBarColor,
      value: widget.value, 
      onChanged: widget.onChanged)
    ;
  }
}