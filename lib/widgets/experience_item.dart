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
        gradient: theme.isDark ? AppColors.darkGlassGradient : AppColors.glassGradient,
        boxShadow: isHighlighted
            ? [
                BoxShadow(
                  color: theme.colors.primary.withOpacity(0.1),
                  offset: const Offset(4, 4),
                  blurRadius: 10,
                  spreadRadius: -2,
                ),
                BoxShadow(
                  color: theme.colors.shadowLight.withOpacity(0.1),
                  offset: const Offset(-4, -4),
                  blurRadius: 10,
                  spreadRadius: -2,
                ),
              ]
            : null,
        border: Border.all(
          color: theme.colors.primary.withOpacity(isHighlighted ? 0.3 : 0.1),
          width: isHighlighted ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isHighlighted ? theme.colors.primary : theme.colors.text,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            company,
            style: TextStyle(
              color: theme.colors.primary,
              fontSize: 16,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              color: theme.colors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          ...points.map((point) => _buildBulletPoint(point)),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, _) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.arrow_right, color: theme.colors.primary, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: theme.colors.textSecondary,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
