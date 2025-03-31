import 'package:flutter/material.dart';

class AppColors {
  // Main color palette - Updated for better visibility
  static const primary = Color(0xFF48A6A7);     // Teal
  static const background = Color(0xFFF7F7F7);  // Light Gray
  static const text = Color(0xFF004A4F);        // Dark Teal
  static const textSecondary = Color(0xFF006A71); // Medium Teal
  static const navy = Color(0xFFE5F3F7);        // Very Light Blue
  static const accent = Color(0xFF006A71);      // Dark Teal
  static const highlight = Color(0xFF48A6A7);   // Teal

  // Surface and shadow colors - Enhanced contrast
  static const surfaceLight = Color(0xFFFFFFFF); // Pure White
  static const shadowDark = Color(0xFF006A71);   // Dark Teal
  static const shadowLight = Color(0xFF9ACBD0);  // Light Blue
  static const highlightBorder = Color(0xFF48A6A7); // Teal

  // Gradients - More visible
  static final glassGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      surfaceLight,
      surfaceLight.withOpacity(0.9),
    ],
  );

  static final comicGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      navy,
      primary.withOpacity(0.8),
    ],
  );

  static const darkComicGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      darkColor2, // Blood Red
      darkColor8, // Steel Pink
      darkColor4, // Keppel
      darkColor5, // Electric Blue
    ],
  );

  static final comicHighlightGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primary.withOpacity(0.2),
      navy.withOpacity(0.1),
    ],
  );

  // Dark theme colors - cyberpunk inspired
  static const darkBackground = Color(0xFF1E201E);  // Dark background
  static const darkSurface = Color(0xFF3C3D37);    // Dark surface
  static const darkPrimary = Color(0xFFECDFCC);    // Cream for text/borders
  static const darkAccent = Color(0xFF697565);     // Sage for accents
  static const darkHighlight = Color(0xFFECDFCC);  // Cream for highlights

  // New dark mode color palette
  static const darkColor1 = Color(0xFF272932); // Raisin Black
  static const darkColor2 = Color(0xFF710000); // Blood Red
  static const darkColor3 = Color(0xFFFDF500); // Rich Lemon
  static const darkColor4 = Color(0xFF1AC5B0); // Keppel
  static const darkColor5 = Color(0xFF37EBF3); // Electric Blue
  static const darkColor6 = Color(0xFF937DDB); // Flushing Purple
  static const darkColor7 = Color(0xFFE455AE); // Rose Petal
  static const darkColor8 = Color(0xFFCB1DCD); // Steel Pink
  static const darkColor9 = Color(0xFFD1C5C0); // Pale Silver

  // Ninja Theme Colors
  static const ninjaRed = Color(0xFFFF1F1F);      // Brighter red
  static const ninjaDark = Color(0xFF000000);     // Pure black
  static const ninjaLight = Color(0xFFFFFFFF);    // Pure white
  static const ninjaAccent = Color(0xFFB30000);   // Dark red
  static const ninjaShadow = Color(0xFF1A0000);   // Very dark red
  static const ninjaText = Color(0xFFFFFFFF);     // White
  static const ninjaTextSecondary = Color(0xFFFF8888); // Light red

  static final ninjaGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      ninjaDark,
      ninjaDark,
      ninjaRed.withOpacity(0.15),
      ninjaDark,
    ],
    stops: const [0.0, 0.4, 0.6, 1.0],
  );

  static final ninjaGlassGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      ninjaRed.withOpacity(0.1),
      ninjaDark.withOpacity(0.9),
      ninjaDark.withOpacity(0.95),
    ],
  );

  static ThemeColors get light => const ThemeColors(
        primary: primary,
        background: background,
        text: text,
        textSecondary: textSecondary,
        surface: surfaceLight,
        accent: accent,
        navy: navy,
        shadowDark: shadowDark,
        shadowLight: shadowLight,
        highlightBorder: highlightBorder,
      );

  static ThemeColors get dark => ThemeColors(
        primary: darkColor3, // Rich Lemon for primary elements
        background: darkColor1, // Raisin Black for background
        text: darkColor3, // Rich Lemon for text
        textSecondary: darkColor9.withOpacity(0.9), // Pale Silver for secondary text
        surface: darkColor1.withOpacity(0.6), // Raisin Black for surfaces
        accent: darkColor5, // Electric Blue for accents
        navy: darkColor2, // Blood Red for navy
        shadowDark: darkColor1, // Raisin Black for shadows
        shadowLight: darkColor5.withOpacity(0.4), // Electric Blue for light shadows
        highlightBorder: darkColor7, // Rose Petal for borders
      );

  static final darkGlassGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      darkColor6.withOpacity(0.4), // Flushing Purple
      darkColor8.withOpacity(0.4), // Steel Pink
      darkColor4.withOpacity(0.4), // Keppel
      darkColor5.withOpacity(0.4), // Electric Blue
    ],
  );

  static final synthwaveGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      darkColor1, // Raisin Black
      darkColor2.withOpacity(0.8), // Blood Red
      darkColor8.withOpacity(0.6), // Steel Pink
      darkColor7.withOpacity(0.4), // Rose Petal
    ],
  );

  static final synthwaveGridGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      darkColor5.withOpacity(0.5), // Electric Blue
      darkColor8.withOpacity(0.3), // Steel Pink
      darkColor2.withOpacity(0.2), // Blood Red
      Colors.transparent,
    ],
  );

  static LinearGradient getGlassGradient(bool isDark) => 
      isDark ? darkGlassGradient : glassGradient;

  static LinearGradient getComicGradient(bool isDark) =>
      isDark ? darkComicGradient : comicGradient;

  static LinearGradient getComicHighlightGradient(bool isDark) => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      (isDark ? darkPrimary : primary).withOpacity(0.2),
      (isDark ? darkSurface : navy).withOpacity(0.1),
    ],
  );

  static BoxDecoration getComicBox(bool isDark) => BoxDecoration(
    color: isDark ? darkSurface : surfaceLight,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(
      color: isDark ? darkPrimary.withOpacity(0.3) : primary,
      width: 2,
    ),
    boxShadow: [
      BoxShadow(
        color: (isDark ? darkBackground : shadowDark).withOpacity(0.2),
        offset: const Offset(8, 8),
        blurRadius: 15,
        spreadRadius: -2,
      ),
      BoxShadow(
        color: (isDark ? darkPrimary : primary).withOpacity(0.1),
        offset: const Offset(-4, -4),
        blurRadius: 10,
        spreadRadius: -2,
      ),
    ],
  );

  static BoxDecoration getMainContainer(bool isDark) => BoxDecoration(
    color: isDark ? darkSurface : surfaceLight,
    borderRadius: BorderRadius.circular(20),
    gradient: isDark ? darkComicGradient : comicGradient,
    border: Border.all(
      color: isDark ? darkPrimary.withOpacity(0.3) : primary,
      width: 2,
    ),
    boxShadow: [
      BoxShadow(
        color: (isDark ? darkBackground : shadowDark).withOpacity(0.2),
        offset: const Offset(8, 8),
        blurRadius: 15,
        spreadRadius: -2,
      ),
      BoxShadow(
        color: (isDark ? darkPrimary : primary).withOpacity(0.1),
        offset: const Offset(-4, -4),
        blurRadius: 10,
        spreadRadius: -2,
      ),
    ],
  );

  static BoxDecoration getSynthwaveBackground(bool isDark) => BoxDecoration(
    gradient: isDark ? synthwaveGradient : null,
    color: isDark ? null : background,
  );

  static BoxDecoration getDarkContainer() => BoxDecoration(
        color: darkSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: darkPrimary.withOpacity(0.3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: darkBackground.withOpacity(0.6),
            offset: const Offset(8, 8),
            blurRadius: 15,
          ),
          BoxShadow(
            color: darkPrimary.withOpacity(0.1),
            offset: const Offset(-4, -4),
            blurRadius: 10,
          ),
        ],
      );
}

class ThemeColors {
  final Color primary;
  final Color background;
  final Color text;
  final Color textSecondary;
  final Color surface;
  final Color accent;
  final Color navy;
  final Color shadowDark;
  final Color shadowLight;
  final Color highlightBorder;

  const ThemeColors({
    required this.primary,
    required this.background,
    required this.text,
    required this.textSecondary,
    required this.surface,
    required this.accent,
    required this.navy,
    required this.shadowDark,
    required this.shadowLight,
    required this.highlightBorder,
  });
}
