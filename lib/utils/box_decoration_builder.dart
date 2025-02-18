import 'package:flutter/material.dart';

BoxDecoration boxDecorationBuilder(
    BoxDecoration? decoration, BoxDecoration defaultDecoration) {
  BoxDecoration? customDecoration = decoration;
  if (customDecoration != null) {
    customDecoration = customDecoration.copyWith(
      color: customDecoration.color ?? defaultDecoration.color,
      image: customDecoration.image ?? defaultDecoration.image,
      border: customDecoration.border ?? defaultDecoration.border,
      borderRadius:
          customDecoration.borderRadius ?? defaultDecoration.borderRadius,
      boxShadow: customDecoration.boxShadow ?? defaultDecoration.boxShadow,
      gradient: customDecoration.gradient ?? defaultDecoration.gradient,
      backgroundBlendMode: customDecoration.backgroundBlendMode ??
          defaultDecoration.backgroundBlendMode,
      shape: customDecoration.shape,
    );
  } else {
    customDecoration = defaultDecoration;
  }
  return customDecoration;
}
