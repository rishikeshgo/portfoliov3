import 'package:flutter/material.dart';
import 'package:portfolio_v2/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_v2/providers/theme_provider.dart';

class SkillItem extends StatelessWidget {
  final String skill;
  final String iconPath;

  const SkillItem({
    super.key,
    required this.skill,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.isDark ? AppColors.darkColor1.withOpacity(0.7) : theme.colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.isDark ? AppColors.darkColor5.withOpacity(0.3) : theme.colors.primary.withOpacity(0.3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.isDark ? AppColors.darkColor5.withOpacity(0.2) : theme.colors.shadowDark,
            offset: const Offset(4, 4),
            blurRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'icons/$iconPath',
            height: 24,
            width: 24,
            colorFilter: ColorFilter.mode(
              theme.isDark ? AppColors.darkColor3 : theme.colors.primary,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            skill,
            style: TextStyle(
              color: theme.isDark ? AppColors.darkColor9 : theme.colors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
