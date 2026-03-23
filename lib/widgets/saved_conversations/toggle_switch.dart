import 'package:flutter/material.dart';

class ToggleSwitch extends StatelessWidget {
  final bool enabled;

  const ToggleSwitch({super.key, this.enabled = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13, 
        vertical: 2
        ),
      decoration: BoxDecoration(
        color:Color(0xFF7A6F66).withOpacity(0.18),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color(0xFF7A6F66).withOpacity(0.3),
          width: 1,
        )
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration:  BoxDecoration(
              color: Color(0xFF7A6F66).withOpacity(0.4),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            enabled ? '1' : '0',
            style:  TextStyle(
              color: Color(0xFF7A6F66).withOpacity(0.4),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}