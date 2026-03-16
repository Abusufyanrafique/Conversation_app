import 'package:flutter/material.dart';

class QuestionDotIndicator extends StatelessWidget {
  final int currentIndex;
  final int total;

  const QuestionDotIndicator({
    super.key,
    required this.currentIndex,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        total,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: currentIndex == index ? 18 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: currentIndex == index
            ? Color(0xFFA09890)
            : Color(0xFFA09890).withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}