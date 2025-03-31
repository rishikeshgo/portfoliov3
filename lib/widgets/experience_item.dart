import 'package:flutter/material.dart';
import 'package:portfolio_v2/constants/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_v2/providers/theme_provider.dart';

class ExperienceItem extends StatelessWidget {
  final String title;
  final String company;
  final String date;
  final List<String> points;
  final bool isHighlighted;

  const ExperienceItem({
    super.key,
    required this.title,
    required this.company,
    required this.date,
    required this.points,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: theme.colors.surface,
        borderRadius: BorderRadius.circular(15),
        gradient: theme.isNinja
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.ninjaRed.withOpacity(0.1),
                  AppColors.ninjaDark.withOpacity(0.95),
                ],
              )
            : (theme.isDark
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.darkColor2.withOpacity(0.4),  // Blood Red
                      AppColors.darkColor1.withOpacity(0.8),  // Raisin Black
                      AppColors.darkColor8.withOpacity(0.3),  // Steel Pink
                    ],
                  )
                : AppColors.glassGradient),
        boxShadow: [
          if (theme.isDark)
            BoxShadow(
              color: AppColors.darkColor5.withOpacity(0.2),  // Electric Blue glow
              blurRadius: 15,
              spreadRadius: 1,
            ),
          if (isHighlighted || !theme.isDark)
            BoxShadow(
              color: theme.colors.primary.withOpacity(0.2),
              offset: const Offset(4, 4),
              blurRadius: 10,
              spreadRadius: -2,
            ),
        ],
        border: Border.all(
          color: theme.isDark
              ? AppColors.darkColor3.withOpacity(0.4) // Rich Lemon for Cyberpunk
              : theme.isNinja
                  ? AppColors.ninjaAccent.withOpacity(0.4) // Dark Red for Ninja
                  : theme.colors.primary.withOpacity(0.2), // Teal for Light
          width: isHighlighted ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: theme.isDark
                  ? AppColors.darkColor3 // Rich Lemon for Cyberpunk
                  : theme.isNinja
                      ? AppColors.ninjaRed // Bright Red for Ninja
                      : theme.colors.primary, // Teal for Light
              fontSize: 24,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: theme.colors.primary.withOpacity(0.5),
                  offset: const Offset(0, 0),
                  blurRadius: theme.isDark ? 8 : 2,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            company,
            style: TextStyle(
              color: theme.isDark
                  ? AppColors.darkColor5 // Electric Blue for Cyberpunk
                  : theme.isNinja
                      ? AppColors.ninjaText // White for Ninja
                      : theme.colors.text, // Dark Teal for Light
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: TextStyle(
              color: theme.isNinja 
                  ? AppColors.ninjaTextSecondary
                  : theme.colors.textSecondary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          ...points.map((point) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: theme.colors.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: theme.colors.primary.withOpacity(0.3),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    point,
                    style: TextStyle(
                      color: theme.isDark 
                          ? AppColors.darkColor9.withOpacity(0.95) // Pale Silver with increased opacity
                          : theme.colors.textSecondary,
                      fontSize: 16,
                      height: 1.5,
                      letterSpacing: 0.3,
                      shadows: theme.isDark ? [
                        Shadow(
                          color: AppColors.darkColor9.withOpacity(0.3),
                          offset: const Offset(0, 0),
                          blurRadius: 2,
                        ),
                      ] : null,
                    ),
                  ),
                ),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }
}
