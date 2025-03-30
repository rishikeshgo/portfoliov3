import 'package:flutter/material.dart';
import 'package:portfolio_v2/widgets/nav_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_v2/providers/theme_provider.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const NavBar({
    super.key,
    required this.onAboutTap,
    required this.onExperienceTap,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return Container(
      width: 100,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: theme.colors.primary.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Text(
              'R',
              style: TextStyle(
                color: theme.colors.primary,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: RotatedBox(
              quarterTurns: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavItem(
                    title: 'Contact',
                    index: 3,
                    onTap: onContactTap,
                  ),
                  NavItem(
                    title: 'Projects',
                    index: 2,
                    onTap: onProjectsTap,
                  ),
                  NavItem(
                    title: 'Experience',
                    index: 1,
                    onTap: onExperienceTap,
                  ),
                  NavItem(
                    title: 'About',
                    index: 0,
                    onTap: onAboutTap,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  launchUrl(Uri.parse('https://www.linkedin.com/in/rishikesh-govind-447788359/'));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: theme.colors.primary.withOpacity(0.3),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    FontAwesomeIcons.linkedin,
                    color: theme.colors.primary,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
