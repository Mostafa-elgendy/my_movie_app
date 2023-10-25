import 'package:flutter/material.dart';
import 'package:my_movie_app/core/utils/styles.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: slidingAnimation,
          child: const Text(
            "See Your Best Movies",
            style: Styles.textStyle18,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
