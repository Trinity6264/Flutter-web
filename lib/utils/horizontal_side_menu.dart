import 'package:flutter/material.dart';
import 'package:flutterweb_practice/controller/menu_item_controller.dart';
import 'package:flutterweb_practice/style/const_color.dart';
import 'package:flutterweb_practice/utils/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HorizontalSideMenu extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;
  const HorizontalSideMenu({
    Key? key,
    required this.onPressed,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<MenuItemController>(
      builder: (context, model, child) {
        return InkWell(
          onTap: onPressed,
          onHover: (value) {
            print('object');
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
                    height: 40,
                    width: 6,
                    color: darkColor,
                  ),
                ),
                SizedBox(
                  width: size.width / 80,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: model.returnIcon(name),
                ),
                if (model.isActive(name))
                  Flexible(
                    child: CustomText(
                      text: name,
                      textStyle: GoogleFonts.poppins(
                        color:
                            model.isHovering(name) ? darkColor : lightGreyColor,
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
          ),
        );
      },
    );
  }
}
