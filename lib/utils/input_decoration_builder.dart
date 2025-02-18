import 'package:flutter/material.dart';

InputDecoration inputDecorationBuilder(
    InputDecoration? decoration, InputDecoration defaultDecoration) {
  InputDecoration? customDecoration = decoration;
  if (customDecoration != null) {
    customDecoration = customDecoration.copyWith(
      icon: customDecoration.icon ?? defaultDecoration.icon,
      iconColor: customDecoration.iconColor ?? defaultDecoration.iconColor,
      label: customDecoration.label ?? defaultDecoration.label,
      labelText: customDecoration.labelText ?? defaultDecoration.labelText,
      labelStyle: customDecoration.labelStyle ?? defaultDecoration.labelStyle,
      floatingLabelStyle: customDecoration.floatingLabelStyle ??
          defaultDecoration.floatingLabelStyle,
      helperText: customDecoration.helperText ?? defaultDecoration.helperText,
      helperStyle:
          customDecoration.helperStyle ?? defaultDecoration.helperStyle,
      helperMaxLines:
          customDecoration.helperMaxLines ?? defaultDecoration.helperMaxLines,
      hintText: customDecoration.hintText ?? defaultDecoration.hintText,
      hintStyle: customDecoration.hintStyle ?? defaultDecoration.hintStyle,
      hintTextDirection: customDecoration.hintTextDirection ??
          defaultDecoration.hintTextDirection,
      hintMaxLines:
          customDecoration.hintMaxLines ?? defaultDecoration.hintMaxLines,
      errorText: customDecoration.errorText ?? defaultDecoration.errorText,
      errorStyle: customDecoration.errorStyle ?? defaultDecoration.errorStyle,
      errorMaxLines:
          customDecoration.errorMaxLines ?? defaultDecoration.errorMaxLines,
      floatingLabelBehavior: customDecoration.floatingLabelBehavior ??
          defaultDecoration.floatingLabelBehavior,
      floatingLabelAlignment: customDecoration.floatingLabelAlignment ??
          defaultDecoration.floatingLabelAlignment,
      isCollapsed: customDecoration.isCollapsed,
      isDense: customDecoration.isDense ?? defaultDecoration.isDense,
      contentPadding:
          customDecoration.contentPadding ?? defaultDecoration.contentPadding,
      prefixIcon: customDecoration.prefixIcon ?? defaultDecoration.prefixIcon,
      prefix: customDecoration.prefix ?? defaultDecoration.prefix,
      prefixText: customDecoration.prefixText ?? defaultDecoration.prefixText,
      prefixIconConstraints: customDecoration.prefixIconConstraints ??
          defaultDecoration.prefixIconConstraints,
      prefixStyle:
          customDecoration.prefixStyle ?? defaultDecoration.prefixStyle,
      prefixIconColor:
          customDecoration.prefixIconColor ?? defaultDecoration.prefixIconColor,
      suffixIcon: customDecoration.suffixIcon ?? defaultDecoration.suffixIcon,
      suffix: customDecoration.suffix ?? defaultDecoration.suffix,
      suffixText: customDecoration.suffixText ?? defaultDecoration.suffixText,
      suffixStyle:
          customDecoration.suffixStyle ?? defaultDecoration.suffixStyle,
      suffixIconColor:
          customDecoration.suffixIconColor ?? defaultDecoration.suffixIconColor,
      suffixIconConstraints: customDecoration.suffixIconConstraints ??
          defaultDecoration.suffixIconConstraints,
      counter: customDecoration.counter ?? defaultDecoration.counter,
      counterText:
          customDecoration.counterText ?? defaultDecoration.counterText,
      counterStyle:
          customDecoration.counterStyle ?? defaultDecoration.counterStyle,
      filled: customDecoration.filled ?? defaultDecoration.filled,
      fillColor: customDecoration.fillColor ?? defaultDecoration.fillColor,
      focusColor: customDecoration.focusColor ?? defaultDecoration.focusColor,
      hoverColor: customDecoration.hoverColor ?? defaultDecoration.hoverColor,
      errorBorder:
          customDecoration.errorBorder ?? defaultDecoration.errorBorder,
      focusedBorder:
          customDecoration.focusedBorder ?? defaultDecoration.focusedBorder,
      focusedErrorBorder: customDecoration.focusedErrorBorder ??
          defaultDecoration.focusedErrorBorder,
      disabledBorder:
          customDecoration.disabledBorder ?? defaultDecoration.disabledBorder,
      enabledBorder:
          customDecoration.enabledBorder ?? defaultDecoration.enabledBorder,
      border: customDecoration.border ?? defaultDecoration.border,
      enabled: customDecoration.enabled,
      semanticCounterText: customDecoration.semanticCounterText ??
          defaultDecoration.semanticCounterText,
      alignLabelWithHint: customDecoration.alignLabelWithHint ??
          defaultDecoration.alignLabelWithHint,
      constraints:
          customDecoration.constraints ?? defaultDecoration.constraints,
    );
  } else {
    customDecoration = defaultDecoration;
  }
  return customDecoration;
}
