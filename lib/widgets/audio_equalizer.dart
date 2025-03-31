import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio_v2/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AudioEqualizer extends StatefulWidget {
  const AudioEqualizer({super.key});

  @override
  State<AudioEqualizer> createState() => _AudioEqualizerState();
}

class _AudioEqualizerState extends State<AudioEqualizer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<double> _barHeights = List.generate(30, (_) => 0.0);
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..addListener(_updateBars);
    _controller.repeat();
  }

  void _updateBars() {
    setState(() {
      for (int i = 0; i < _barHeights.length; i++) {
        _barHeights[i] = _random.nextDouble();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    final isDark = theme.isDark;

    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            theme.colors.primary.withOpacity(0.1),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          _barHeights.length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: 4,
            height: _barHeights[index] * 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  theme.colors.primary.withOpacity(0.3),
                  theme.colors.primary,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? theme.colors.primary.withOpacity(0.5)
                      : theme.colors.primary.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
