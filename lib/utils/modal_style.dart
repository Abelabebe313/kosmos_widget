import 'package:asalema_widgets/asalema_widgets.dart';
import 'package:asalema_widgets/utils/text_style_builder.dart';
import 'package:flutter/material.dart';

class ModalStyle {
  ModalStyle({
    this.backgroundColorTop = const Color.fromARGB(220, 224, 224, 224),
    this.backGroundColorBottom = Colors.white,
    this.spacerColor = const Color.fromARGB(255, 155, 155, 155),
    this.titleStyle,
    this.textStyle1,
    this.textStyle2,
    this.textStyleBottom,
  }) {
    titleStyle = textStyleBuilder(
      titleStyle,
      TextStyle(
        fontFamily: 'Poppins',
        color: const Color(0xFF3C3C43).withOpacity(0.6),
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
      ),
    );
    textStyle1 = textStyleBuilder(
      textStyle1,
      TextStyle(
        fontFamily: 'Poppins',
        color: const Color(0xFF007AFF),
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      ),
    );
    textStyle2 = textStyleBuilder(
      textStyle2,
      TextStyle(
        fontFamily: 'Poppins',
        color: const Color(0xFFF52929),
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      ),
    );
    textStyleBottom = textStyleBuilder(
      textStyleBottom,
      TextStyle(
        fontFamily: 'Poppins',
        color: const Color(0xFF007AFF),
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  TextStyle? titleStyle;
  TextStyle? textStyle1;
  TextStyle? textStyle2;
  TextStyle? textStyleBottom;

  Color backgroundColorTop;
  Color backGroundColorBottom;
  Color spacerColor;
}
