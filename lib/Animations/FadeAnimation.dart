import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:page_transition/page_transition.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween("opacity", Tween(begin: 0.0, end: 1.0), duration: const Duration(milliseconds: 500))
      ..tween("translateY", Tween(begin: -130.0, end: 0.0), duration: const Duration(milliseconds: 500), curve: Curves.easeOut);

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, animation, child) {
        return Opacity(
          opacity: animation.get<double>("opacity"),
          child: Transform.translate(
            offset: Offset(0, animation.get<double>("translateY")),
            child: child,
          ),
        );
      },
    );
  }
}
