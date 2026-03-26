import 'package:flutter/material.dart';

class DotsIndicatorWidget extends StatelessWidget {
  final int totalDots;
  final int activeDot;

  const DotsIndicatorWidget({
    super.key,
    this.totalDots = 3,
    this.activeDot = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalDots, (index) {
        final bool isActive = index == activeDot;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 6,
          width: isActive ? 24 : 6,
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Color(0xFF9C9590),
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
}