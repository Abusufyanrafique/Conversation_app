import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/providers/Card_Interation/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NavigationRow extends StatelessWidget {
  const NavigationRow({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CardProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _NavButton(
          icon: Icons.chevron_left,
          onTap: provider.isFirstCard ? null : provider.previousCard,
        ),
        const SizedBox(width: 12),
        _DrawLabel(),
        const SizedBox(width: 12),
        _NavButton(
          icon: Icons.chevron_right,
          onTap: provider.isLastCard ? null : provider.nextCard,
        ),
      ],
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _NavButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedOpacity(
        opacity: isDisabled ? 0.3 : 1.0,
        duration: const Duration(milliseconds: 200),     
          child: Icon(
            icon,
            color: const Color(0xFF7A6F66),
            size: 18,
          ),
        
      ),
    );
  }
}

class _DrawLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        AppText.draw,
        style: TextStyle(
          fontSize: 10,
          letterSpacing: 1.76,
          color: Color(0xFF9E7C7C),
        ),
      ),
    );
  }
}