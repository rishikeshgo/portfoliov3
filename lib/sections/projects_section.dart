import 'package:flutter/material.dart';
import 'package:portfolio_v2/widgets/project_card.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_v2/providers/theme_provider.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
                  '03. Projects',
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
          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: [
              ProjectCard(
                title: 'Some Apps in GRAPES IDMR',
                description: 'A mobile application for managing digital medical records and healthcare services',
                technologies: const ['Flutter', 'REST API'],
                backgroundColor: theme.colors.surface.withOpacity(theme.isDark ? 0.8 : 1.0), // Adjust for dark mode
              ).animate().fadeIn(delay: const Duration(milliseconds: 200 * 1)),
              ProjectCard(
                title: 'Medicine Reminder System',
                description: 'Personal project: Mobile app to help users manage their medications',
                technologies: const ['Flutter', 'SQLite', 'Local Notifications'],
                backgroundColor: theme.colors.surface.withOpacity(theme.isDark ? 0.8 : 1.0), // Adjust for dark mode
              ).animate().fadeIn(delay: const Duration(milliseconds: 200 * 2)),
              ProjectCard(
                title: 'Portfolio Website',
                description: 'Personal portfolio website built with modern web technologies',
                technologies: const ['Flutter Web', 'Custom Animations', 'Responsive Design'],
                backgroundColor: theme.colors.surface.withOpacity(theme.isDark ? 0.8 : 1.0), // Adjust for dark mode
              ).animate().fadeIn(delay: const Duration(milliseconds: 200 * 3)),
            ],
          ).animate().fadeIn(delay: 200.ms),
        ],
      ),
    );
  }
}
