import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimationEffects {
  static List<Effect> get fadeInSlide => [
        FadeEffect(duration: 600.ms),
        SlideEffect(
          begin: const Offset(0, 0.2),
          end: const Offset(0, 0),
          duration: 600.ms,
          curve: Curves.easeOut,
        ),
      ];

  static List<Effect> get scaleIn => [
        ScaleEffect(
          duration: 400.ms,
          curve: Curves.easeOut,
          begin: const Offset(0.8, 0.8),
          end: const Offset(1, 1),
        ),
        FadeEffect(duration: 400.ms),
      ];

  static List<Effect> get shimmer => [
        ShimmerEffect(
          duration: 2.seconds,
          color: Colors.white10,
        ),
      ];

  static List<Effect> get hover => [
        ScaleEffect(
          begin: const Offset(1, 1),
          end: const Offset(1.05, 1.05),
          duration: 200.ms,
          curve: Curves.easeOut,
        ),
      ];
}

extension WidgetAnimationExtension on Widget {
  Widget withDefaultAnimation({Duration? delay}) {
    return animate(
      onPlay: (controller) => controller.repeat(),
      delay: delay ?? 200.ms,
    ).addEffects(AnimationEffects.fadeInSlide);
  }

  Widget withHoverAnimation() {
    return animate(
      target: 1,
      onPlay: (controller) => controller.repeat(),
    ).addEffects(AnimationEffects.hover);
  }
}
