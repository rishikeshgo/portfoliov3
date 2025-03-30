import 'package:flutter/material.dart';
import 'package:portfolio_v2/constants/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  ThemeColors get colors => _isDark ? AppColors.dark : AppColors.light;

  String get modeName => _isDark ? 'Cyberpunk Mode' : 'Electrifying Mode';

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
