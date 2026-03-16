import 'package:flutter/material.dart';

// ignore: camel_case_types
class Custom_Button_who extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final bool useGradient;
  final bool isActive;
  final double? width;
  final double height;

  const Custom_Button_who({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.useGradient = false,
    this.isActive = false,
    this.width,
    this.height = 56,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xFF2B2622)
              : const Color(0xFFEFE7DE),
          borderRadius: BorderRadius.circular(14),

          // ── isActive false → white border, no shadow ──
          // ── isActive true  → no border, shadow show ──
          border: isActive
              ? null
              : Border.all(
                  color: Colors.white,
                  width: 1,
                ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.25),
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ]
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: isActive
                ? Colors.white
                : const Color(0xFF2B2622),
            letterSpacing: 2.16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}