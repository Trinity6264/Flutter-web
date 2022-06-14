import 'package:flutter/material.dart';
import 'package:flutterweb_practice/controller/menu_item_controller.dart';
import 'package:flutterweb_practice/utils/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../style/const_color.dart';

class VerticalSideMenu extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;
  const VerticalSideMenu({
    Key? key,
    required this.onPressed,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuItemController>(
      builder: (context, model, child) {
        return InkWell(
          onTap: onPressed,
          onHover: (value) {
            value ? model.onHover(name) : model.onHover('***');
          },
          child: Container(
            color: model.isHovering(name)
                ? lightGreyColor.withOpacity(.1)
                : Colors.transparent,
            child: Row(
              children: [
                Visibility(
                  visible: model.isHovering(name) || model.isActive(name),
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                  child: Container(
                    height: 72,
                    width: 3,
                    color: darkColor,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: model.returnIcon(name),
                      ),
                      if (model.isActive(name))
                        Flexible(
                          child: CustomText(
                            text: name,
                            textStyle: GoogleFonts.poppins(
                              color: model.isHovering(name)
                                  ? darkColor
                                  : lightGreyColor,
                            ),
                          ),
                        )
                      else
                        Flexible(
                          child: CustomText(
                            text: name,
                            textStyle: GoogleFonts.poppins(
                              color: darkColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
