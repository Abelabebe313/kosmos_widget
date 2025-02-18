import 'package:asalema_widgets/themeData/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeDataProvider = ChangeNotifierProvider((ref) {
  return ThemeDataprovider();
});

// Using one stream for the authenticated user //
class ThemeDataprovider with ChangeNotifier {
  ThemeDataApp _themeDataApp = themeDataAppFeed;

  ThemeDataApp get themeDataApp => _themeDataApp;

  void setThemeDataApp(ThemeDataApp themeDataApp) {
    _themeDataApp = themeDataApp;
  }
}
