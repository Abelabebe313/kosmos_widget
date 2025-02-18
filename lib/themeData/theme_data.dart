import 'package:asalema_widgets/asalema_widgets.dart';
import 'package:asalema_widgets/themeData/theme_data_helper.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'theme_data.freezed.dart';

@freezed
class ThemeDataApp with _$ThemeDataApp {
  const factory ThemeDataApp({
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    TextStyle? contentStyle,
    TextStyle? socialStyle,
    TextStyle? openTitleStyle,
    TextStyle? openSubtitleStyle,
    TextStyle? openContentStyle,
    TextStyle? openSocialStyle,
    ModalStyle? modalStyle,
    @Default(false) bool useCheck,
    ChewieProgressColors? chewieProgressColors,
    CommentPublicationStyle? commentPublicationStyle,
    CommentBottombarStyle? commentBottombarStyle,
    @Default(Colors.white) Color? backgroundColor,
    Color? openBackgroundColor,
    @Default(10.0) double? borderRadius,
    Color? spinnerColor,
    @Default(Colors.white) Color? spinnerBackgroundColor,
  }) = _ThemeDataApp;
}

ThemeDataApp defaultThemeDataApp() => ThemeDataApp(
      borderRadius: 10.r,
      spinnerBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      spinnerColor: ThemeDataHelper.createMaterialColor(const Color(0xFF830FA5)),
      commentPublicationStyle: CommentPublicationStyle(
        decorationMe: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF830FA5),
              Color(0xFF653A74),
            ],
          ),
        ),
      ),
    );

final themeDataAppFeed = ThemeDataApp(
  borderRadius: 10.r,
  spinnerBackgroundColor: Colors.white,
  backgroundColor: Colors.white,
  spinnerColor: ThemeDataHelper.createMaterialColor(const Color(0xFF830FA5)),
  commentPublicationStyle: CommentPublicationStyle(
    decorationMe: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFF830FA5),
          Color(0xFF653A74),
        ],
      ),
    ),
  ),
);
