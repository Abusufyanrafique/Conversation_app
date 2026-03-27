import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionButtonsSection extends StatelessWidget {
  const ActionButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _OutlinedActionButton(
          label: 'MANAGE SUBSCRIPTION',
          onTap: () {},
        ),
        const SizedBox(height: 12),
        _OutlinedActionButton(
          label: 'RESTORE PURCHASES',
          onTap: () {},
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {},
          child:  Text(
            'Cancel Subscription',
           style: GoogleFonts.jost(
              fontSize: 9,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF9C9890),
            ),
          ),
        ),
      ],
    );
  }
}

class _OutlinedActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _OutlinedActionButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20),
        child: Container(
          width: double.infinity,
          height: 55,
          // padding: const EdgeInsets.symmetric(vertical: 0),
          decoration: BoxDecoration(
            color: Color(0xFFEFE7DE),
            borderRadius: BorderRadius.circular(15.87),
            border: Border.all(
              color:  Colors.white, 
              width: 1
              ),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: GoogleFonts.jost(
                fontSize: 11,
                letterSpacing: 1.98,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF2B2622),
              ),
          ),
        ),
      ),
    );
  }
}