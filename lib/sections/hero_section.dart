import 'package:flutter/material.dart' hide ThemeMode;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio_v2/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_v2/providers/theme_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(50),
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
        ).animate().fadeIn(duration: 800.ms),
        Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(50),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hi, my name is',
                style: TextStyle(
                  color: theme.colors.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              )
                  .animate()
                  .fadeIn(delay: 200.ms)
                  .slideX(begin: -0.2),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: theme.colors.surface,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          theme.colors.surface,
                          theme.colors.surface.withOpacity(0.9),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colors.shadowDark.withOpacity(0.8),
                          offset: const Offset(8, 8),
                          blurRadius: 15,
                          spreadRadius: -2,
                        ),
                        BoxShadow(
                          color: theme.colors.shadowLight.withOpacity(0.15),
                          offset: const Offset(-4, -4),
                          blurRadius: 10,
                          spreadRadius: -2,
                        ),
                        BoxShadow(
                          color: theme.colors.primary.withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: 1,
                        ),
                      ],
                      border: Border.all(
                        color: theme.colors.primary.withOpacity(0.2),
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(38),
                      child: Image.asset(
                        'assets/img/pro_pic.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 300.ms)
                      .scale(),
                  Text(
                    'Rishikesh Govind M R',
                    style: TextStyle(
                      color: theme.colors.text,
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -2,
                      height: 1.1,
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 400.ms)
                      .slideX(begin: -0.2),
                ],
              ),
              const SizedBox(height: 10),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'I build things for the mobile & web.',
                    textStyle: TextStyle(
                      color: theme.isDark
                          ? AppColors.darkColor5 // Electric Blue for Cyberpunk
                          : theme.isNinja
                              ? AppColors.ninjaRed // Bright Red for Ninja
                              : theme.colors.primary, // Teal for Light
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                totalRepeatCount: 1,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 600,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: theme.colors.textSecondary,
                      fontSize: 20,
                    ),
                    children: [
                      const TextSpan(text: 'I\'m a '),
                      TextSpan(
                        text: 'Flutter Developer ',
                        style: TextStyle(
                          color: theme.colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: 'specializing in building exceptional digital experiences. '
                        'Currently, I\'m focused on building accessible, human-centered mobile applications '
                        'at GRAPES INNOVATIVE SOLUTIONS.',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              OutlinedButton(
                onPressed: () {
                  launchUrl(
                    Uri.parse('https://drive.google.com/uc?export=download&id=1SfQNI6z_xJ1udcXSSZDuOSgphMd0JVcf'),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: theme.colors.primary),
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Download Resume',
                      style: TextStyle(
                        color: theme.colors.primary,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.download,
                      color: theme.colors.primary,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ].animate().then(delay: 200.ms),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  _ThemeModeButton(
                    label: 'Cyberpunk Mode',
                    iconPath: 'assets/img/Cyberpunk_2077_logo.svg',
                    isActive: theme.isDark,
                    onPressed: () => theme.setTheme(ThemeMode.dark),
                  ),
                  const SizedBox(width: 10),
                  _ThemeModeButton(
                    label: 'Ninja Mode',
                    iconPath: 'assets/img/ninja.svg',
                    isActive: theme.isNinja,
                    onPressed: () => theme.setTheme(ThemeMode.ninja),
                  ),
                  const SizedBox(width: 10),
                  _ThemeModeButton(
                    label: 'Electrifying Mode',
                    iconPath: 'assets/img/electrifying.svg',
                    isActive: !theme.isDark && !theme.isNinja,
                    onPressed: () => theme.setTheme(ThemeMode.light),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ).animate().fadeIn();
  }
}

class _ThemeModeButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final bool isActive;
  final VoidCallback onPressed;

  const _ThemeModeButton({
    required this.label,
    required this.iconPath,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive ? AppColors.primary : AppColors.textSecondary.withOpacity(0.5),
            width: 2,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                isActive ? AppColors.primary : AppColors.textSecondary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isActive ? AppColors.primary : AppColors.textSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ).animate(
        onPlay: (controller) => controller.repeat(),
      ).shimmer(
        duration: 2.seconds,
        color: isActive ? AppColors.primary.withOpacity(0.3) : Colors.transparent,
      ),
    ).animate().scale(
      duration: 200.ms,
      curve: Curves.easeInOut,
    );
  }
}
