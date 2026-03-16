import 'package:flutter/material.dart';

class IconContainerWidget extends StatelessWidget {
  final IconData icon;
  final double size;
  final double iconSize;
  final Color backgroundColor;
  final Color iconColor;
  final double borderRadius;

  const IconContainerWidget({
    super.key,
    this.icon = Icons.chat_bubble_outline,
    this.size = 56,
    this.iconSize = 24,
    this.backgroundColor = const Color(0xFF3D3630),
    this.iconColor = Colors.white54,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}