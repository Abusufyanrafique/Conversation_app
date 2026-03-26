import 'dart:math' as math;
import 'package:conversation_app/models/card_model.dart';
import 'package:flutter/material.dart';

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
        // height: 355,
        // width: 272,
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

  const _CardFace({
    required this.text,
    required this.isBack,
  });

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;

    final cardWidth  = sw * 0.68;   // 272 / 400 ≈ 0.68
    final cardHeight = sh * 0.46;   // 355 / 780 ≈ 0.46
    final radius     = sw * 0.052;  // 20.66 proportional
    final fontSize   = sw * 0.085;  // 33.81 proportional
    final hPad       = sw * 0.07;   // 28px proportional
    final vPad       = sh * 0.031;  // 24px proportional
    final iconSize   = sw * 0.05;   // 20px proportional

    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: const Color(0xFF3F3A35).withOpacity(0.20),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: hPad,
            vertical: vPad,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isBack)
                Padding(
                  padding: EdgeInsets.only(bottom: sh * 0.02),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white.withOpacity(0.3),
                    size: iconSize,
                  ),
                ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFFEFE7DE),
                  fontWeight: FontWeight.w400,
                  fontFamily: "PeachBlue",
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}