import 'package:flutter/material.dart';
import 'package:flutterweb_practice/helpers/responsiveness.dart';
import 'package:flutterweb_practice/utils/horizontal_side_menu.dart';
import 'package:flutterweb_practice/utils/vertical_side_menu.dart';

class SideMenuItem extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;
  const SideMenuItem({
    Key? key,
    required this.onPressed,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Responsiveness.isMediumScreen(context)) {
      return VerticalSideMenu(onPressed: onPressed, name: name);
    }

    return HorizontalSideMenu(onPressed: onPressed, name: name);
  }
}
