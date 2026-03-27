import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Trust badges row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
          ],
        ),
        const SizedBox(height: 14),
        // Disclaimer text
         Text(
          'Subscription renews automatically. Manage or cancel at any time in your device settings.',
          textAlign: TextAlign.center,
          style: GoogleFonts.jost(
              fontSize: 9,
              fontWeight: FontWeight.w300,
              color: const Color(0xFF9C9890),
            ),
        ),
        const SizedBox(height: 14),
        // Privacy & Terms links
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _FooterLink(
              label: 'Privacy Policy',
              onTap: () {},
            ),
            const SizedBox(width: 20),
            _FooterLink(
              label: 'Terms of Service',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

// class _TrustBadge extends StatelessWidget {
//   final String text;

//   const _TrustBadge({required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 8, 
//         vertical: 4
//         ),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.7),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: const Color(0xFFD9C5BC), 
//           width: 0.8
//           ),
//       ),
//       child: Text(
//         text,
//         style: GoogleFonts.jost(
//               fontSize: 9,
//               fontWeight: FontWeight.w300,
//               color: const Color(0xFF9C9890),
//             ),
//       ),
//     );
//   }
// }

class _FooterLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _FooterLink({
    required this.label, 
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
       label,
       style: GoogleFonts.jost(
              fontSize: 8.6,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF9C9890),
            ),
      ),
    );
  }
}