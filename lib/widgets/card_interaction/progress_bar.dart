import 'package:conversation_app/providers/Card_Interation/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CardProvider>();
    final progress = (provider.currentIndex + 1) / provider.totalCards;

    return Row(
      children: [
        const Text(
          'PROGRESS',
          style: TextStyle(
            fontSize: 8,
            letterSpacing: 1.5,
            color: Color(0xFF9E7C7C),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: progress),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
              builder: (_, value, __) => LinearProgressIndicator(
                value: value,
                minHeight: 4,
                backgroundColor: const Color(0xFFE8D5CC),
                valueColor: const AlwaysStoppedAnimation(Color(0xFFBF8C8C)),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Consumer<CardProvider>(
          builder: (_, p, __) => Text(
            '${p.currentIndex + 1} / ${p.totalCards}',
            style: const TextStyle(
              fontSize: 9,
              letterSpacing: 1,
              color: Color(0xFF9E7C7C),
            ),
          ),
        ),
      ],
    );
  }
}