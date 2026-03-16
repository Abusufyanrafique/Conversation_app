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
    return Container(
      width: 220,
      height: 295,
      decoration: BoxDecoration(
        color: isFlipped ? Colors.white : const Color(0xFFC99E97).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: isFlipped ? _QuestionFace(card: card) : _CardFront(card: card),
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
      children: [
        // Background image
        Positioned.fill(
          child: Image.asset(
            card.imagePath,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const _FallbackCardFront(),
          ),
        ),

        // Overlay gradient for text readability
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.15),
                ],
              ),
            ),
          ),
        ),

        // Top label
        // const Positioned(
        //   top: 20,
        //   left: 0,
        //   right: 0,
        //   child: Text(
        //     'THE CONVERSATION COLLECTION',
        //     textAlign: TextAlign.center,
        //     style: TextStyle(
        //       fontSize: 7,
        //       letterSpacing: 2,
        //       color: Colors.white70,
        //       fontFamily: 'Georgia',
        //     ),
        //   ),
        // ),

        // Center icon
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // Text(
          //   'THE CONVERSATION\nCOLLECTION',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     fontSize: 10,
          //     letterSpacing: 2,
          //     color: Colors.white70,
          //     fontFamily: 'Georgia',
          //     height: 1.8,
          //   ),
          // ),
          SizedBox(height: 20),
          _ChatIcon(),
          SizedBox(height: 20),
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
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(
          //   '"${card.question}"',
          //   textAlign: TextAlign.center,
          //   style: const TextStyle(
          //     fontSize: 15,
          //     fontStyle: FontStyle.italic,
          //     color: Color(0xFF4A3535),
          //     fontFamily: 'Georgia',
          //     height: 1.7,
          //   ),
          // ),
          // const SizedBox(height: 28),
          // const Text(
          //   'THE CONVERSATION COLLECTION',
          //   style: TextStyle(
          //     fontSize: 7,
          //     letterSpacing: 2,
          //     color: Color(0xFF9E7C7C),
          //   ),
          // ),
        ],
      ),
    );
  }
}

// ── Chat bubble icon ─────────────────────────────────────
class _ChatIcon extends StatelessWidget {
  const _ChatIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}