import 'package:flutter/material.dart';
import 'package:flutterweb_practice/helpers/responsiveness.dart';
import 'package:flutterweb_practice/style/const_color.dart';
import 'package:flutterweb_practice/utils/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar customAppBar(
  GlobalKey<ScaffoldState> scaffoldState,
  BuildContext context,
) {
  Size _size = MediaQuery.of(context).size;
  return AppBar(
    elevation: 0,
    backgroundColor: whiteColor,
    leading: !Responsiveness.isSmallScreen(context)
        ? Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 14),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 28,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : IconButton(
            onPressed: () => scaffoldState.currentState!.openDrawer(),
            icon: const Icon(
              Icons.menu,
              color: darkColor,
            ),
          ),
    title: Visibility(
      child: CustomText(
        text: 'Viva-Demo',
        textStyle: GoogleFonts.poppins(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: darkColor.withOpacity(.7),
        ),
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.settings,
          color: darkColor.withOpacity(.7),
        ),
      ),
      const SizedBox(width: 15),
      Center(
        child: Stack(
          children: [
            Icon(Icons.notifications, color: darkColor.withOpacity(.7)),
            Positioned(
              left: 10,
              bottom: 12,
              child: Container(
                height: 12,
                width: 15,
                decoration: const BoxDecoration(
                  color: activeColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(width: 10),
      Container(
        width: 1,
        height: 1,
        margin: const EdgeInsets.symmetric(vertical: 20),
        color: lightGreyColor,
      ),
      const SizedBox(width: 20),
      Center(
        child: CustomText(
          text: 'Alex',
          textStyle: GoogleFonts.poppins(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: darkColor.withOpacity(.7),
          ),
        ),
      ),
      const SizedBox(width: 20),
      Container(
        width: 30,
        height: 20,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: lightColor,
        ),
        child: const Center(
          child: Icon(Icons.person_outline, color: darkColor),
        ),
      ),
      const SizedBox(width: 20),
    ],
  );
}
