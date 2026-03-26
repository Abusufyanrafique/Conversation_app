import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TagChip extends StatelessWidget {
  final String label;
  final bool isLocked;
  final bool isAllOpen;
  final Color color;

  const TagChip({
    super.key,
    required this.label,
    required this.isLocked,
    required this.color,
    this.isAllOpen = false,
  });

  @override
  Widget build(BuildContext context) {
    // ── Background color ──
    Color bgColor;
    if (isAllOpen) {
      bgColor = Colors.black.withOpacity(0.25);
    } else if (isLocked) {
      bgColor = Colors.black.withOpacity(0.18);
    } else {
      bgColor = Colors.white.withOpacity(0.16);
    }

    Color borderColor = isLocked
        ? Colors.white.withOpacity(0.20)
        : Colors.white.withOpacity(0.16);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 2,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: borderColor,
          width: 1.2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLocked)
            const Padding(
              padding: EdgeInsets.only(left: 4),
              child: Image(
                image: AssetImage("assets/icons/authentication/lock.png"),
                height: 14,
                width: 14,
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(
              left: 4,
              right: 4,
              top: 3,
              bottom: 2,
            ),
            child: Text(
              label,
              style: GoogleFonts.jost(
                fontSize: 8.1,
                letterSpacing: 0.5,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}