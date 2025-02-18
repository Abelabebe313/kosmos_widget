import 'package:asalema_widgets/asalema_widgets.dart';
import 'package:asalema_widgets/utils/box_decoration_builder.dart';
import 'package:asalema_widgets/utils/text_style_builder.dart';
import 'package:flutter/material.dart';

class CommentPublicationStyle {
  CommentPublicationStyle({
    this.backgroundColor = Colors.white,
    this.decoration,
    this.titleStyle,
    this.dateStyle,
    this.commentStyle,
    this.backgroundColorMe = const Color(0xFF02132B),
    this.decorationMe,
    this.titleStyleMe,
    this.dateStyleMe,
    this.commentStyleMe,
  }) {
    Color mainTextColor = Colors.white;
    if (backgroundColor.red * 0.299 +
            backgroundColor.green * 0.587 +
            backgroundColor.blue * 0.114 >
        186) {
      mainTextColor = const Color(0xFF02132B);
    }

    Color mainTextColorMe = Colors.white;
    if (backgroundColorMe.red * 0.299 +
            backgroundColorMe.green * 0.587 +
            backgroundColorMe.blue * 0.114 >
        186) {
      mainTextColorMe = const Color(0xFF02132B);
    }

    decoration = boxDecorationBuilder(
      decoration,
      BoxDecoration(
        gradient: decoration?.gradient,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: mainTextColor.withOpacity(0.2),
          width: 0.5.w,
        ),
      ),
    );
    titleStyle = textStyleBuilder(
      titleStyle,
      TextStyle(
        fontFamily: 'Poppins',
        color: mainTextColor,
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
      ),
    );
    dateStyle = textStyleBuilder(
      dateStyle,
      TextStyle(
        fontFamily: 'Poppins',
        color: mainTextColor.withOpacity(0.65),
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
      ),
    );
    commentStyle = textStyleBuilder(
      commentStyle,
      TextStyle(
        fontFamily: 'Poppins',
        color: mainTextColor.withOpacity(0.86),
        fontSize: 10.5.sp,
        fontWeight: FontWeight.w400,
      ),
    );
    socialStyle = textStyleBuilder(
      socialStyle,
      TextStyle(
        fontFamily: 'Poppins',
        color: mainTextColor.withOpacity(0.65),
        fontSize: 10.5.sp,
        fontWeight: FontWeight.w400,
      ),
    );

    decorationMe = boxDecorationBuilder(
      decorationMe,
      BoxDecoration(
        color: backgroundColorMe,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: backgroundColorMe,
          width: 0.5.w,
        ),
      ),
    );
    titleStyleMe = textStyleBuilder(
      titleStyleMe,
      titleStyle!.copyWith(color: mainTextColorMe),
    );
    dateStyleMe = textStyleBuilder(
      dateStyleMe,
      dateStyle!.copyWith(
        color: mainTextColorMe.withOpacity(0.65),
      ),
    );
    commentStyleMe = textStyleBuilder(
      commentStyleMe,
      commentStyle!.copyWith(
        color: mainTextColorMe.withOpacity(0.86),
      ),
    );
    socialStyleMe = textStyleBuilder(
      socialStyleMe,
      socialStyle!.copyWith(
        color: mainTextColorMe.withOpacity(0.65),
      ),
    );
  }

  Color backgroundColor;
  BoxDecoration? decoration;
  TextStyle? titleStyle;
  TextStyle? dateStyle;
  TextStyle? commentStyle;
  TextStyle? socialStyle;

  Color backgroundColorMe;
  BoxDecoration? decorationMe;
  TextStyle? titleStyleMe;
  TextStyle? dateStyleMe;
  TextStyle? commentStyleMe;
  TextStyle? socialStyleMe;
}
