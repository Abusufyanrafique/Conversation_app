import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/ui/screens/authentication/see_you_again_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ─────────────────────────────────────────
//  Single Restore Option Container
// ─────────────────────────────────────────
class RestoreOptionTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const RestoreOptionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16, 
          vertical: 14
          ),
        decoration: BoxDecoration(
          color: const Color(0xFFF4EFEA).withOpacity(0.1),
          borderRadius: BorderRadius.circular(15.87),
          border: Border.all(
            color:  Colors.white,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // ── Icon Box ──
            Container(
              width: 34,
              height: 36,
              decoration: BoxDecoration(
                color: const Color(0xFF7A6F66).withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: icon),
            ),

            const SizedBox(width: 14),

            // ── Title + Subtitle ──
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.jost(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF2B2622),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: GoogleFonts.jost(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF9C9590),
                    ),
                  ),
                ],
              ),
            ),

            // ── Chevron ──
            const Icon(
              Icons.chevron_right,
              color: Color(0xFF9C9590),
              size:16,
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────
//  All 3 Restore Containers + Bottom Text
// ─────────────────────────────────────────
class RestoreOptionsSection extends StatelessWidget {
  const RestoreOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Restore with Email ──
        RestoreOptionTile(
          icon:  Image.asset(
            AppImages.email,
            width: 20,
            height: 20,
          ),
          title: 'Restore with email',
          subtitle: 'Sign in to your existing account',
          onTap: () {
            Navigator.push(
            context,
            MaterialPageRoute(
           builder: (context) => const SeeYouAgainScreen(),
             ),
  );
          },
        ),

        const SizedBox(height: 10),

        // ── Restore with Apple ──
        RestoreOptionTile(
          icon:  Image.asset(
            'assets/icons/authentication/apple.png',
            width: 20,
            height: 20,
          ),
          title: 'Restore with Apple',
          subtitle: 'If you signed with apple',
          onTap: () {
            Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const SeeYouAgainScreen(),
    ),
  );
          },
        ),

        const SizedBox(height: 10),

        // ── Restore with Google ──
        RestoreOptionTile(
          icon: Image.asset(
            'assets/icons/authentication/google.png',
            width: 20,
            height: 20,
          ),
          title: 'Restore with Google',
          subtitle: 'If you signed with google',
          onTap: () {
            Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const SeeYouAgainScreen(),
    ),
  );
          },
        ),

        const SizedBox(height: 12.4),

        // ── Bottom Text ──
        Text(
          'Purchases are tied to your account, not your device.\nSign in to restore access to all unlocked decks.',
          textAlign: TextAlign.center,
          style: GoogleFonts.jost(
            height: 2,
            fontSize: 10,
            fontWeight: FontWeight.w300,
            color: const Color(0xFF7A6F66),
            
          ),
        ),
      ],
    );
  }
}