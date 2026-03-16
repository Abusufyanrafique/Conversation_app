import 'package:conversation_app/providers/Card_Interation/card_provider.dart';
import 'package:conversation_app/widgets/card_interaction/single_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeckView extends StatelessWidget {
  const DeckView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CardProvider>();
    final visibleCards = provider.visibleDeckCards;

    return Center(
      child: SizedBox(
        width: 240,
        height: 320,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // ── Background shadow cards (deck effect) ──
            if (visibleCards.length >= 3)
              Positioned(
                top: 12,
                child: Transform.rotate(
                  angle: 0.08,
                  child: _ShadowCard(opacity: 0.4),
                ),
              ),
            if (visibleCards.length >= 2)
              Positioned(
                top: 12,
                child: Transform.rotate(
                  angle: -0.01,
                  child: _ShadowCard(opacity: 0.65),
                ),
              ),

            // ── Active card with flip animation ──
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) {
                final rotate = Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeOut),
                );
                return AnimatedBuilder(
                  animation: rotate,
                  builder: (context, child) => Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY((1 - rotate.value) * 3.14),
                    alignment: Alignment.center,
                    child: child,
                  ),
                  child: child,
                );
              },
              child: SingleCardWidget(
                key: ValueKey('${provider.currentIndex}_${provider.isCardFlipped}'),
                card: provider.currentCard,
                isFlipped: provider.isCardFlipped,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShadowCard extends StatelessWidget {
  final double opacity;

  const _ShadowCard({required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: 220,
        height: 295,
        decoration: BoxDecoration(
          color: const Color(0xFFBF8C8C),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
      ),
    );
  }
}