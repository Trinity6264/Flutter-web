import 'package:flutter/material.dart';
import 'package:flutterweb_practice/controller/menu_item_controller.dart';
import 'package:flutterweb_practice/pages/dashboard.dart';
import 'package:flutterweb_practice/style/const_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuItemController>.value(
          value: MenuItemController(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        title: 'Admin Web Panel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: whiteColor,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ).apply(
            bodyColor: blackColor,
          ),
          primarySwatch: Colors.blue,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            },
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const DashBoard(),
        },
      ),
    );
  }
}
