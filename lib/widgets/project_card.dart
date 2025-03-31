import 'package:flutter/material.dart';
import 'package:portfolio_v2/constants/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_v2/providers/theme_provider.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final Color backgroundColor;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.technologies,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        gradient: theme.isDark ? LinearGradient(
          colors: [
            AppColors.darkColor1.withOpacity(0.8),
            AppColors.darkColor4.withOpacity(0.1),
          ],
        ) : null,
        border: Border.all(
          color: theme.isDark 
              ? AppColors.darkColor5.withOpacity(0.3)
              : theme.colors.primary.withOpacity(0.3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colors.shadowDark.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: theme.colors.text,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              color: theme.colors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: technologies.map((tech) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: theme.colors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: theme.colors.primary.withOpacity(0.3),
                ),
              ),
              child: Text(
                tech,
                style: TextStyle(
                  color: theme.colors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}
