import 'package:flutter/material.dart';
import 'dart:ui';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final bool useGradient;
  final double? width;
  final double height;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.useGradient = false,
    this.width,
    this.height = 56,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: _GradientBorderPainter(),
        child: Container(
          width: width ?? double.infinity,
          height: height,
          decoration: BoxDecoration(
            // ── Background ──
            gradient: useGradient
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF524C47),
                      const Color(0xFF524C47).withOpacity(0.66),
                    ],
                  )
                : null,
            color: useGradient ? null : backgroundColor ?? Colors.black,
            borderRadius: BorderRadius.circular(14),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: textColor ?? Colors.white,
              letterSpacing: 2.16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

// ── Gradient Border Painter ──
class _GradientBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rRect = RRect.fromRectAndRadius(
      rect,
      const Radius.circular(14),
    );

    final paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF524C47),                    // Top — solid
          Color(0x80524C47),                    // Bottom — 66% opacity
        ],
      ).createShader(rect)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}