import 'package:flutter/material.dart';

import '../../style/const_color.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: blackColor,
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            color: activeColor,
          ),
        ),
      ],
    );
  }
}
