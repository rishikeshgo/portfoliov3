import 'package:flutter/material.dart';
import 'package:portfolio_v2/constants/app_colors.dart';
import 'package:portfolio_v2/widgets/experience_item.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_v2/providers/theme_provider.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return Container(
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: theme.colors.primary.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '02. Experience',
                  style: TextStyle(
                    color: theme.colors.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 1,
                  color: theme.colors.primary.withOpacity(0.3),
                ).animate(delay: 500.ms).fadeIn().moveX(),
              ),
            ],
          ).animate().fadeIn().slideX(),
          const SizedBox(height: 50),
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: theme.colors.surface,
              borderRadius: BorderRadius.circular(20),
              gradient: AppColors.getGlassGradient(theme.isDark),
              boxShadow: [
                BoxShadow(
                  color: theme.colors.shadowDark.withOpacity(0.4),
                  offset: const Offset(15, 15),
                  blurRadius: 25,
                  spreadRadius: -8,
                ),
                BoxShadow(
                  color: theme.colors.highlightBorder.withOpacity(0.3),
                  offset: const Offset(-10, -10),
                  blurRadius: 20,
                  spreadRadius: -5,
                ),
              ],
              border: Border.all(
                color: theme.colors.primary.withOpacity(0.5),
                width: 1.5,
              ),
            ),
            child: const ExperienceItem(
              title: 'Application Developer',
              isHighlighted: true,
              company: 'GRAPES INNOVATIVE SOLUTIONS',
              date: 'August 2024 - Present',
              points: [
                'Developing mobile applications using Flutter',
                'Working on client projects and delivering high-quality solutions',
                'Collaborating with team members to achieve project goals',
              ],
            ),
          ).animate().fadeIn(delay: 200.ms).slideX(),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: theme.colors.surface,
              borderRadius: BorderRadius.circular(20),
              gradient: AppColors.getGlassGradient(theme.isDark),
              boxShadow: [
                BoxShadow(
                  color: theme.colors.shadowDark.withOpacity(0.2),
                  offset: const Offset(15, 15),
                  blurRadius: 25,
                  spreadRadius: -8,
                ),
                BoxShadow(
                  color: theme.colors.highlightBorder.withOpacity(0.1),
                  offset: const Offset(-10, -10),
                  blurRadius: 20,
                  spreadRadius: -5,
                ),
              ],
              border: Border.all(
                color: theme.colors.primary.withOpacity(0.2),
                width: 1.5,
              ),
            ),
            child: const ExperienceItem(
              title: 'Intern',
              company: 'KOMPETENZEN TECHNOLOGIES',
              date: 'August 2023 - June 2024',
              points: [
                'Worked with JAVA, CORE-JAVA, HTML, MYSQL',
                'Gained experience in BOOTSTRAP, JAVASCRIPT, REACT',
                'Participated in team projects and learned industry practices',
              ],
            ),
          ).animate().fadeIn(delay: 400.ms).slideX(),
        ],
      ),
    );
  }
}
