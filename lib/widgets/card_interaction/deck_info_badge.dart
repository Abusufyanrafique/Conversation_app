import 'package:conversation_app/Utils/app_textstyles.dart';
import 'package:flutter/material.dart';

class DeckInfoBadge extends StatelessWidget {
  final String label;
  final Color dotColor;
  final Color bgColor;
  final Color textColor;

  const DeckInfoBadge({
    super.key,
    required this.label,
    required this.dotColor,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 24,
      // width: 167,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: const Border(
          top: BorderSide(color: Colors.white, width: 2.0),    // Upar zyada
          bottom: BorderSide(color: Colors.white, width: 0.5), // Neeche kam
          left: BorderSide(color: Colors.white, width: 1.0),
          right: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 7),
                 Text(
                 label,
                 style:  AppTextStyles.jost(
                  letterSpacing: 2.16,
                        fontSize: 10,
                        color: 
                         Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
          ),
        ],
      ),
    );
  }
}