import 'package:conversation_app/models/conversation_card.dart';
import 'package:flutter/material.dart';

class SingleCardWidget extends StatelessWidget {
  final ConversationCard card;
  final bool isFlipped;

  const SingleCardWidget({
    super.key,
    required this.card,
    required this.isFlipped,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 280,
      child: DecoratedBox(
        decoration: BoxDecoration(
          // color: isFlipped
          //     ? const Color(0xFFCAA099).withOpacity(0.1)
          //     : const Color(0xFFC99E97).withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          child: isFlipped
              ? _QuestionFace(card: card)
              : _CardFront(card: card),
        ),
      ),
    );
  }
}

// ── Card Front (image side) ──────────────────────────────
class _CardFront extends StatelessWidget {
  final ConversationCard card;
  const _CardFront({required this.card});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand, // ← Stack parent ko fully fill kare
      children: [
        // ── Background image ──
        Image.asset(
          card.imagePath,
          // fit: BoxFit.cover,
          key: ValueKey(card.imagePath),
          errorBuilder: (_, __, ___) => const _FallbackCardFront(),
        ),

        // ── Center icon ──
        const Center(
          child: _ChatIcon(),
        ),
      ],
    );
  }
}

// ── Fallback if image not found ──────────────────────────
class _FallbackCardFront extends StatelessWidget {
  const _FallbackCardFront();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFBF8C8C),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Text(
            'CARD TO DRAW',
            style: TextStyle(
              fontSize: 8,
              letterSpacing: 2,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Question Face (flipped side) ────────────────────────
class _QuestionFace extends StatelessWidget {
  final ConversationCard card;

  const _QuestionFace({required this.card});

  @override
  Widget build(BuildContext context) {
    // ── SizedBox.expand — ClipRRect ki poori space fill karta hai ──
    return SizedBox.expand(
      child: ColoredBox(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '"${card.question}"',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF4A3535),
                  fontFamily: 'peach-blue',
                  height: 1.7,
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'THE CONVERSATION COLLECTION',
                style: TextStyle(
                  fontSize: 7,
                  letterSpacing: 2,
                  color: Color(0xFF9E7C7C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Chat bubble icon ─────────────────────────────────────
class _ChatIcon extends StatelessWidget {
  const _ChatIcon();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}