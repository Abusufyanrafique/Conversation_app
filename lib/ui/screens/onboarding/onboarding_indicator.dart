import 'package:flutter/material.dart';

class OnboardingIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const OnboardingIndicator({
    super.key,
    required this.currentPage,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        final isActive = currentPage == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 22 : 5,
          height: isActive ? 5 : 5,
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0xFF7A6F66)
                : const Color(0xFF7A6F66).withOpacity(0.28),
            borderRadius: BorderRadius.circular(isActive ? 3 : 3), // circle for small
          ),
        );
      }),
    );
  }
}