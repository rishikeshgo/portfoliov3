import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' show launch;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_v2/providers/theme_provider.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return Container(
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            theme.colors.primary.withOpacity(0.05),
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            '04. Contact',
            style: TextStyle(
              color: theme.colors.primary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ).animate(delay: 200.ms).fadeIn().slideY(),
          const SizedBox(height: 20),
          Text(
            'Get In Touch',
            style: TextStyle(
              color: theme.colors.text,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ).animate(delay: 400.ms).fadeIn().slideY(),
          const SizedBox(height: 20),
          SizedBox(
            width: 600,
            child: Text(
              'I\'m currently looking for new opportunities. Whether you have a question or just want to say hi, I\'ll try my best to get back to you!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.colors.textSecondary,
                fontSize: 20,
              ),
            ),
          ).animate(delay: 600.ms).fadeIn().slideY(),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              launch('mailto:rishikeshgovind720@gmail.com');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              side: BorderSide(color: theme.colors.primary),
              shadowColor: theme.colors.primary.withOpacity(0.3),
              elevation: 8,
            ),
            child: Text(
              'Say Hello',
              style: TextStyle(
                color: theme.colors.primary,
                fontSize: 16,
              ),
            ),
          ).animate(
            onPlay: (controller) => controller.repeat(),
          ).shimmer(
            duration: 2000.ms,
            color: theme.colors.primary.withOpacity(0.3),
          ).animate(delay: 600.ms).scale(),
        ].animate(delay: 200.ms).fadeIn(duration: 600.ms),
      ),
    );
  }
}
