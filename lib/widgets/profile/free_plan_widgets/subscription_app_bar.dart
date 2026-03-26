import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscriptionAppBar extends StatelessWidget {
  const SubscriptionAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: const Color(0xFFF1ECE5).withOpacity(0.22),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color:  Colors.white,
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.arrow_back,
                size: 16,
                color: Color(0xFF7A6F66),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Text(
            'Subscription',
            style: GoogleFonts.jost(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: const Color(0xFF7A6F66),
            ),
          ),
        ],
      ),
    );
  }
}