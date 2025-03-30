import 'package:flutter/material.dart';
import 'package:portfolio_v2/constants/app_colors.dart';
import 'package:portfolio_v2/widgets/skill_item.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:math' as math;
import 'package:provider/provider.dart';
import 'package:portfolio_v2/providers/theme_provider.dart';
import 'package:portfolio_v2/widgets/about_content.dart';

class GlitchBackgroundPainter extends CustomPainter {
  final double time;
  final ThemeColors colors;
  final List<String> binaryChars = ['0', '1'];
  final math.Random random = math.Random();

  GlitchBackgroundPainter({
    required this.time,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    const cellSize = 15.0; // Smaller cell size for denser matrix
    final columns = (size.width / cellSize).ceil();
    final rows = (size.height / cellSize).ceil();

    for (var i = 0; i < columns; i++) {
      for (var j = 0; j < rows; j++) {
        if (random.nextDouble() < 0.4) { // Increased density
          final char = binaryChars[random.nextInt(2)];
          final opacity = 0.6 - (j / rows * 0.4); // Consistent opacity based on position
          
          textPainter.text = TextSpan(
            text: char,
            style: TextStyle(
              color: colors.primary.withOpacity(opacity),
              fontSize: 12,
              fontFamily: 'monospace',
              fontWeight: FontWeight.w600,
            ),
          );
          textPainter.layout();
          
          final yOffset = (j * cellSize + time * 80) % size.height; // Smoother movement
          textPainter.paint(canvas, Offset(i * cellSize, yOffset));
        }
      }
    }

    // Add scanline effect
    final scanLinePaint = Paint()
      ..color = colors.primary.withOpacity(0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    
    for (var i = 0; i < size.height; i += 4) {
      final scanLineY = (i + time * 100) % size.height;
      canvas.drawLine(
        Offset(0, scanLineY),
        Offset(size.width, scanLineY),
        scanLinePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class AnimatedGlitchBackground extends StatefulWidget {
  const AnimatedGlitchBackground({super.key});

  @override
  State<AnimatedGlitchBackground> createState() => _AnimatedGlitchBackgroundState();
}

class _AnimatedGlitchBackgroundState extends State<AnimatedGlitchBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // Slower animation
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: GlitchBackgroundPainter(
            time: _controller.value,
            colors: theme.colors,
          ),
          child: Container(),
        );
      },
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
                child: const Text(
                  '01. About Me',
                  style: TextStyle(
                    color: AppColors.primary,
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: theme.colors.surface,
                        borderRadius: BorderRadius.circular(20),
                        gradient: AppColors.getGlassGradient(theme.isDark),
                        boxShadow: [
                          BoxShadow(
                            color: theme.colors.shadowDark.withOpacity(0.4),
                            offset: const Offset(12, 12),
                            blurRadius: 20,
                            spreadRadius: -5,
                          ),
                          BoxShadow(
                            color: theme.colors.shadowLight.withOpacity(0.3),
                            offset: const Offset(-8, -8),
                            blurRadius: 20,
                            spreadRadius: -2,
                          ),
                          BoxShadow(
                            color: theme.colors.highlightBorder.withOpacity(0.3),
                            offset: const Offset(-1, -1),
                            blurRadius: 2,
                            spreadRadius: 1,
                          ),
                        ],
                        border: Border.all(
                          color: theme.colors.primary.withOpacity(0.5),
                          width: 1.5,
                        ),
                      ),
                      child: const AboutContent(),
                    ).animate().fadeIn(delay: 200.ms).slideX(),
                    const SizedBox(height: 30),
                    Text(
                      '< Technologies />',
                      style: TextStyle(
                        color: theme.colors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ).animate().fadeIn(delay: 400.ms).slideX(),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: theme.colors.surface,
                        borderRadius: BorderRadius.circular(20),
                        gradient: AppColors.getGlassGradient(theme.isDark),
                        boxShadow: [
                          BoxShadow(
                            color: theme.colors.shadowDark.withOpacity(0.2),
                            offset: const Offset(12, 12),
                            blurRadius: 20,
                            spreadRadius: -5,
                          ),
                          BoxShadow(
                            color: theme.colors.shadowLight.withOpacity(0.15),
                            offset: const Offset(-8, -8),
                            blurRadius: 20,
                            spreadRadius: -2,
                          ),
                          BoxShadow(
                            color: theme.colors.highlightBorder.withOpacity(0.1),
                            offset: const Offset(-1, -1),
                            blurRadius: 2,
                            spreadRadius: 1,
                          ),
                        ],
                        border: Border.all(
                          color: theme.colors.primary.withOpacity(0.2),
                          width: 1.5,
                        ),
                      ),
                      child: const Wrap(
                        spacing: 30,
                        runSpacing: 20,
                        children: [
                          SkillItem(
                            skill: 'Flutter',
                            iconPath: 'flutter.svg',
                          ),
                          SkillItem(
                            skill: 'Python',
                            iconPath: 'python.svg',
                          ),
                          SkillItem(
                            skill: 'JavaScript',
                            iconPath: 'javascript.svg',
                          ),
                          SkillItem(
                            skill: 'HTML & CSS',
                            iconPath: 'html5.svg',
                          ),
                          SkillItem(
                            skill: 'MySQL',
                            iconPath: 'mysql.svg',
                          ),
                          SkillItem(
                            skill: 'React',
                            iconPath: 'react.svg',
                          ),
                          SkillItem(
                            skill: 'Bootstrap',
                            iconPath: 'bootstrap.svg',
                          ),
                          SkillItem(
                            skill: 'Lua',
                            iconPath: 'lua.svg',
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: 500.ms).slideX(),
                  ],
                ),
              ),
              const SizedBox(width: 50),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colors.navy,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      const BoxShadow(
                        color: AppColors.shadowDark,
                        offset: Offset(15, 15),
                        blurRadius: 20,
                        spreadRadius: -5,
                      ),
                      BoxShadow(
                        color: theme.colors.primary.withOpacity(0.1),
                        offset: const Offset(-8, -8),
                        blurRadius: 20,
                        spreadRadius: -2,
                      ),
                      BoxShadow(
                        color: theme.colors.primary.withOpacity(0.05),
                        offset: const Offset(-1, -1),
                        blurRadius: 2,
                        spreadRadius: 1,
                      ),
                    ],
                    border: Border.all(
                      color: theme.colors.primary.withOpacity(0.1),
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Stack(
                      children: [
                        const Positioned.fill(
                          child: AnimatedGlitchBackground(),
                        ),
                        Opacity(
                          opacity: 0.9,
                          child: Image.asset(
                            'assets/img/my_photo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ).animate()
                  .fadeIn(delay: 600.ms)
                  .shimmer(duration: 2000.ms, color: theme.colors.primary.withOpacity(0.1)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
