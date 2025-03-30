import 'package:flutter/material.dart';
import 'package:portfolio_v2/widgets/navbar.dart';
import 'package:portfolio_v2/sections/hero_section.dart';
import 'package:portfolio_v2/sections/about_section.dart';
import 'package:portfolio_v2/sections/experience_section.dart';
import 'package:portfolio_v2/sections/projects_section.dart';
import 'package:portfolio_v2/sections/contact_section.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_v2/providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final aboutKey = GlobalKey();
  final experienceKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.colors.background,
              theme.colors.surface,
              theme.colors.background,
            ],
          ),
        ),
        child: Row(
          children: [
            NavBar(
              onAboutTap: () => scrollToSection(aboutKey),
              onExperienceTap: () => scrollToSection(experienceKey),
              onProjectsTap: () => scrollToSection(projectsKey),
              onContactTap: () => scrollToSection(contactKey),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    const HeroSection(),
                    AboutSection(key: aboutKey),
                    ExperienceSection(key: experienceKey),
                    ProjectsSection(key: projectsKey),
                    ContactSection(key: contactKey),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
