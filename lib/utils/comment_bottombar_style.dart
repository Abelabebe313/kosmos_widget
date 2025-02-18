import 'package:asalema_widgets/asalema_widgets.dart';
import 'package:asalema_widgets/utils/box_decoration_builder.dart';
import 'package:asalema_widgets/utils/input_decoration_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommentBottombarStyle {
  CommentBottombarStyle({
    this.backgroundColor = Colors.white,
    this.cursorColor = const Color(0xFF02132B),
    this.decoration,
    this.inputDecoration,
  }) {
    Color mainTextColor = const Color(0xFFC5C8CD);
    double mult = 3;
    if (backgroundColor.red * 0.299 +
            backgroundColor.green * 0.587 +
            backgroundColor.blue * 0.114 >
        186) {
      mainTextColor = const Color.fromARGB(255, 80, 80, 100);
      mult = 1;
    }

    Widget prefixIcon = SvgPicture.asset(
      'assets/pubsmiley.svg',
      semanticsLabel: 'PubSmiley Icon',
      package: 'asalema_widgets',
      height: 20.5.w,
      width: 20.5.w,
      color: mainTextColor.withOpacity(0.25 * mult),
    );

    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(24.r),
      borderSide: BorderSide(color: mainTextColor.withOpacity(0.10 * mult)),
    );

    decoration = boxDecorationBuilder(
      decoration,
      BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.r),
          topRight: Radius.circular(35.r),
        ),
        boxShadow: [
          BoxShadow(
            color: mainTextColor.withOpacity(0.05),
            spreadRadius: 5,
            blurRadius: 15,
          ),
        ],
      ),
    );

    inputDecoration = inputDecorationBuilder(
      inputDecoration,
      InputDecoration(
        filled: true,
        fillColor: mainTextColor.withOpacity(0.03 * mult),
        border: outlineInputBorder,
        errorBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        focusedErrorBorder: outlineInputBorder,
        contentPadding: EdgeInsets.symmetric(horizontal: 9.w),
        hintText: "Écrire un commentaire...",
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 13.sp,
          color: mainTextColor.withOpacity(0.41),
        ),
      ),
    );
  }

  Color backgroundColor;
  Color cursorColor;
  BoxDecoration? decoration;
  InputDecoration? inputDecoration;
}
