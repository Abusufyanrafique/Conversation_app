import 'package:conversation_app/providers/Card_Interation/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationButtonsWidget extends StatelessWidget {
  const NavigationButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CardProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavButton(
            icon: Icons.chevron_left,
            onTap: provider.currentIndex > 0 ? provider.previousCard : null,
          ),
          const Text(
            'DRAW',
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 2.0,
              color: Color(0xFF9E7A74),
              fontFamily: 'Georgia',
            ),
          ),
          _NavButton(
            icon: Icons.chevron_right,
            onTap: provider.currentIndex < provider.totalCards - 1
                ? provider.nextCard
                : null,
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _NavButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isEnabled = onTap != null;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: isEnabled ? 1.0 : 0.3,
        child: Icon(
          icon,
          size: 22,
          color: const Color(0xFF9E7A74),
        ),
      ),
    );
  }
}