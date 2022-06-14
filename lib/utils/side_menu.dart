import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutterweb_practice/controller/menu_item_controller.dart';
import 'package:flutterweb_practice/helpers/responsiveness.dart';
import 'package:flutterweb_practice/routes/route.dart';
import 'package:flutterweb_practice/style/const_color.dart';
import 'package:flutterweb_practice/utils/custom_text.dart';
import 'package:flutterweb_practice/utils/side_menu_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: lightColor,
      child: ListView(
        children: [
          if (Responsiveness.isMediumScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    SizedBox(width: size.width / 48),
                    Flexible(
                      child: CustomText(
                        text: 'Viva-demo',
                        textStyle: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: activeColor,
                        ),
                      ),
                    ),
                    SizedBox(width: size.width / 48),
                  ],
                ),
                const SizedBox(height: 40),
                Divider(color: lightGreyColor.withOpacity(.1)),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: sideMenuItems
                      .map(
                        (e) => Consumer<MenuItemController>(
                          builder: (context, model, child) {
                            return SideMenuItem(
                              onPressed: () {
                                if (e == authenticationPageRoute) {
                                  // TODO::
                                }
                                if (!model.isActive(e)) {
                                  model.onChangeActiveItem(e);
                                  if (Responsiveness.isSmallScreen(context)) {
                                    Navigator.of(context).pop();
                                    return;
                                  }
                                  // TODO::
                                }
                              },
                              name:
                                  e == authenticationPageRoute ? 'Log out' : e,
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ],
            )
        ],
      ),
    );
  }
}
