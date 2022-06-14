import 'package:flutter/material.dart';
import 'package:flutterweb_practice/helpers/responsiveness.dart';
import 'package:flutterweb_practice/pages/large/large_screen.dart';
import 'package:flutterweb_practice/pages/medium/medium.dart';
import 'package:flutterweb_practice/pages/small/small_screen.dart';
import 'package:flutterweb_practice/utils/custom_appbar.dart';
import 'package:flutterweb_practice/utils/side_menu.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);
  static final GlobalKey<ScaffoldState> scaffoldState =
      GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      drawer: const Drawer(
        child: SideMenu(),
      ),
      appBar: customAppBar(scaffoldState, context),
      body: const Responsiveness(
        largeScreen: LargeScreen(),
        mediumScreen: MediumScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }
}
