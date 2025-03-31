import 'package:flutter/material.dart' hide ThemeMode;
import 'package:portfolio_v2/constants/app_colors.dart' hide ThemeColors;

enum ThemeMode {
  dark,
  light,
  ninja,
}

class ThemeColors {
  final Color primary;
  final Color background;
  final Color surface;
  final Color text;
  final Color textSecondary;
  final Color accent;
  final Color shadowDark;
  final Color shadowLight;
  final Color highlightBorder;
  final Color navy;

  ThemeColors({
    required this.primary,
    required this.background,
    required this.surface,
    required this.text,
    required this.textSecondary,
    required this.accent,
    required this.shadowDark,
    required this.shadowLight,
    required this.highlightBorder,
    required this.navy,
  });

  factory ThemeColors.dark() {
    return ThemeColors(
      primary: AppColors.darkColor3,          // Rich Lemon (yellow)
      background: AppColors.darkColor1,       // Raisin Black
      surface: AppColors.darkColor1.withOpacity(0.6),
      text: AppColors.darkColor5,            // Electric Blue - changed from darkColor3 for better visibility
      textSecondary: AppColors.darkColor9.withOpacity(0.95), // Pale Silver - increased opacity
      accent: AppColors.darkColor5,
      shadowDark: AppColors.darkColor1,
      shadowLight: AppColors.darkColor5,
      highlightBorder: AppColors.darkColor7,
      navy: AppColors.darkColor2,
    );
  }

  factory ThemeColors.light() {
    return ThemeColors(
      primary: AppColors.primary,
      background: AppColors.background,
      surface: AppColors.surfaceLight,
      text: AppColors.text,
      textSecondary: AppColors.textSecondary,
      accent: AppColors.accent,
      shadowDark: AppColors.shadowDark,
      shadowLight: AppColors.shadowLight,
      highlightBorder: AppColors.highlightBorder,
      navy: AppColors.navy,
    );
  }

  factory ThemeColors.ninja() {
    return ThemeColors(
      primary: AppColors.ninjaRed,
      background: AppColors.ninjaDark,
      surface: AppColors.ninjaDark.withOpacity(0.7),
      text: AppColors.ninjaText,
      textSecondary: AppColors.ninjaTextSecondary,
      accent: AppColors.ninjaAccent,
      shadowDark: AppColors.ninjaShadow,
      shadowLight: AppColors.ninjaLight.withOpacity(0.1),
      highlightBorder: AppColors.ninjaRed,
      navy: AppColors.ninjaDark,
    );
  }

  LinearGradient get backgroundGradient {
    if (this == ThemeColors.dark()) {
      return AppColors.darkComicGradient;
    } else if (this == ThemeColors.ninja()) {
      return AppColors.ninjaGradient;
    }
    return AppColors.comicGradient;
  }

  LinearGradient getThemeGradient() {
    if (this == ThemeColors.ninja()) {
      return AppColors.ninjaGlassGradient;
    }
    return backgroundGradient;
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.light;

  bool get isDark => _mode == ThemeMode.dark;
  bool get isNinja => _mode == ThemeMode.ninja;

  ThemeColors get colors {
    switch (_mode) {
      case ThemeMode.dark:
        return ThemeColors.dark();
      case ThemeMode.ninja:
        return ThemeColors.ninja();
      default:
        return ThemeColors.light();
    }
  }

  String get modeName {
    switch (_mode) {
      case ThemeMode.dark:
        return 'Cyberpunk Mode';
      case ThemeMode.ninja:
        return 'Ninja Mode';
      default:
        return 'Electrifying Mode';
    }
  }

  void setTheme(ThemeMode mode) {
    _mode = mode;
    notifyListeners();
  }
}
