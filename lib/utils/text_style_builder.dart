import 'package:flutter/material.dart';

TextStyle textStyleBuilder(TextStyle? style, TextStyle defaultStyle) {
  TextStyle? customStyle = style;
  if (customStyle != null) {
    customStyle = customStyle.copyWith(
      color: customStyle.color ?? defaultStyle.color,
      backgroundColor:
          customStyle.backgroundColor ?? defaultStyle.backgroundColor,
      fontSize: customStyle.fontSize ?? defaultStyle.fontSize,
      fontWeight: customStyle.fontWeight ?? defaultStyle.fontWeight,
      fontStyle: customStyle.fontStyle ?? defaultStyle.fontStyle,
      letterSpacing: customStyle.letterSpacing ?? defaultStyle.letterSpacing,
      wordSpacing: customStyle.wordSpacing ?? defaultStyle.wordSpacing,
      textBaseline: customStyle.textBaseline ?? defaultStyle.textBaseline,
      height: customStyle.height ?? defaultStyle.height,
      leadingDistribution:
          customStyle.leadingDistribution ?? defaultStyle.leadingDistribution,
      locale: customStyle.locale ?? defaultStyle.locale,
      foreground: customStyle.foreground ?? defaultStyle.foreground,
      background: customStyle.background ?? defaultStyle.background,
      shadows: customStyle.shadows ?? defaultStyle.shadows,
      fontFeatures: customStyle.fontFeatures ?? defaultStyle.fontFeatures,
      decoration: customStyle.decoration ?? defaultStyle.decoration,
      decorationColor:
          customStyle.decorationColor ?? defaultStyle.decorationColor,
      decorationStyle:
          customStyle.decorationStyle ?? defaultStyle.decorationStyle,
      decorationThickness:
          customStyle.decorationThickness ?? defaultStyle.decorationThickness,
      debugLabel: customStyle.debugLabel ?? defaultStyle.debugLabel,
      fontFamily: customStyle.fontFamily ?? defaultStyle.fontFamily,
      fontFamilyFallback:
          customStyle.fontFamilyFallback ?? defaultStyle.fontFamilyFallback,
      overflow: customStyle.overflow ?? defaultStyle.overflow,
    );
  } else {
    customStyle = defaultStyle;
  }
  return customStyle;
}
