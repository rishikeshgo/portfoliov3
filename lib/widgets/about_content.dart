import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_v2/providers/theme_provider.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, I\'m Rishikesh Govind',
          style: TextStyle(
            color: theme.colors.text,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'I\'m a passionate software developer with experience in mobile and web development. '
          'My journey in programming started with web technologies and eventually led me to '
          'fall in love with Flutter and cross-platform development.',
          style: TextStyle(
            color: theme.colors.textSecondary,
            fontSize: 16,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Currently, I\'m focused on building responsive and user-friendly applications '
          'that provide real value to users. I enjoy learning new technologies and '
          'constantly improving my skills.',
          style: TextStyle(
            color: theme.colors.textSecondary,
            fontSize: 16,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
