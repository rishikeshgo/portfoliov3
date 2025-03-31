import 'package:flutter/material.dart';
import 'package:portfolio_v2/constants/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_v2/providers/theme_provider.dart';

class SynthwaveBackground extends StatelessWidget {
  final Widget child;

  const SynthwaveBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return Stack(
      children: [
        // Background gradient
        Container(
          decoration: AppColors.getSynthwaveBackground(theme.isDark),
        ),
        if (theme.isDark) ...[
          // Grid effect
          CustomPaint(
            painter: GridPainter(
              gridColor: AppColors.darkColor5.withOpacity(0.3),
              gradient: AppColors.synthwaveGridGradient,
            ),
            size: Size.infinite,
          ),
          // Sun effect
          Positioned(
            bottom: -100,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.darkColor2.withOpacity(0.6),
                    AppColors.darkColor2.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
        ],
        // Content
        child,
      ],
    );
  }
}

class GridPainter extends CustomPainter {
  final Color gridColor;
  final Gradient gradient;

  GridPainter({
    required this.gridColor,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = gridColor
      ..strokeWidth = 1;

    final spacing = size.width / 20;
    final verticalLines = (size.width / spacing).ceil();
    final horizontalLines = (size.height / spacing).ceil();

    // Draw vertical lines
    for (var i = 0; i <= verticalLines; i++) {
      final x = i * spacing;
      canvas.drawLine(
        Offset(x, 0),
        Offset(x * 2, size.height),
        paint,
      );
    }

    // Draw horizontal lines
    for (var i = 0; i <= horizontalLines; i++) {
      final y = i * spacing;
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }

    // Apply gradient overlay
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final gradientPaint = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, gradientPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
