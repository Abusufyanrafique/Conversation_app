import 'dart:math' as math;
import 'package:conversation_app/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlipFoucsScreenCardWidget extends StatefulWidget {
  final CardModel card;
  final bool isFlipped;
  final VoidCallback onFlip;

  const FlipFoucsScreenCardWidget({
    super.key,
    required this.card,
    required this.isFlipped,
    required this.onFlip,
  });

  @override
  State<FlipFoucsScreenCardWidget> createState() =>
      _FlipFoucsScreenCardWidgetState();
}

class _FlipFoucsScreenCardWidgetState extends State<FlipFoucsScreenCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(FlipFoucsScreenCardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isFlipped != oldWidget.isFlipped) {
      if (widget.isFlipped) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onFlip,
      child: SizedBox(
        height: 355,
        width: double.infinity,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final angle = _animation.value * math.pi;
            final isShowingBack = angle > math.pi / 2;

            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(2, 2, 0.001)
                ..rotateY(angle),
              child: isShowingBack
                  ? Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(math.pi),
                      child: _CardFace(
                        text: widget.card.backText,
                        isBack: true,
                      ),
                    )
                  : _CardFace(
                      text: widget.card.frontText,
                      isBack: false,
                    ),
            );
          },
        ),
      ),
    );
  }
}

class _CardFace extends StatelessWidget {
  final String text;
  final bool isBack;

  const _CardFace({required this.text, required this.isBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF3F3A35).withOpacity(0.2),
        borderRadius: BorderRadius.circular(20.66),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
          width: 1,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isBack)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white.withOpacity(0.3),
                    size: 20,
                  ),
                ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.caveat(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}