// TAG CHIP WIDGET
// ────────────────────────────────────

import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final String label;
  final bool isLocked;
  final Color color;
 
  const TagChip({
    super.key,
    required this.label,
    required this.isLocked,
    required this.color,
  });
 
  @override
  Widget build(BuildContext context) {
    final bool isCountChip = label.startsWith('+');
 
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6, 
        vertical: 4
        ),
      decoration: BoxDecoration(
        color: isLocked
            ? color.withOpacity(0.35)
            : Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isLocked
              ? color.withOpacity(0.2)
              : Colors.white.withOpacity(0.5),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLocked)
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Icon(
                Icons.lock,
                size: 9,
                color: color.withOpacity(0.8),
              ),
            ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isLocked ? color.withOpacity(0.9) : const Color(0xFF5A4545),
              fontFamily: 'Georgia',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}