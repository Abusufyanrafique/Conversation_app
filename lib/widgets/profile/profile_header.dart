import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/providers/profile/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();

    return Container(
      padding: const EdgeInsets.only(top: 28.24,left: 24.35,bottom: 23.98),
      decoration: BoxDecoration(
        color: const Color(0xFFF4EFEA).withOpacity(0.01),
        borderRadius: BorderRadius.circular(15.87),
        border: Border.all(
          color: Colors.white, 
          width: 1
          ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          Stack(
  children: [
    // Original avatar container
    Container(
      width: 75.97,
      height: 75.97,
      decoration: BoxDecoration(
        color: const Color(0xFF7A6F66),
        borderRadius: BorderRadius.circular(15.87),
        border: Border.all(
          color: Colors.white,
          width: 1.02,
        ),
      ),
      child: Center(
        child: Text(
          user.name[0],
          style: GoogleFonts.jost(
            fontSize: 25.33,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ),
    ),
    // White indicator (bottom-right)
    Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        width: 23.38,
        height:23.38,
        decoration: BoxDecoration(
          color: Color(0xFFF2EDE7).withOpacity(0.92),
          borderRadius: BorderRadius.circular(7.79),
          border: Border.all(
            color:  Colors.white.withOpacity(0.55),
            width: 1,
          ),
        ),
        child: Image(image: AssetImage(AppImages.pen)),
      ),
    ),
  ],
),
          const SizedBox(width: 17.53),
          // Name & Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${user.name} ',
                        style: GoogleFonts.jost(
                          fontSize: 25.33,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFF1C1A17),
                        ),
                      ),
                      TextSpan(
                        text: user.lastName,
                        style: GoogleFonts.jost(
                          fontSize: 25.32,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFF7A6F66),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user.email,
                  style: GoogleFonts.jost(
                    fontSize: 9.8,
                    color: const Color(0xFF7A6F66),
                    letterSpacing: 0.67,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                // Plan Badge
                GestureDetector(
                  onTap: () {
                    context.read<UserProvider>().togglePlan();
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: user.isPremium
                          ? const Color(0xFF9D9890).withOpacity(0.12)
                          : const Color(0xFF9D9890).withOpacity(0.12),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: user.isPremium
                            ? const Color(0xFF9D9890).withOpacity(0.22)
                            : const Color(0xFF9D9890).withOpacity(0.22),
                        width: 0.8,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 6,
                          color: user.isPremium
                              ? const Color(0xFF7A6F66)
                              : const Color(0xFF9C9890),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          user.planLabel,
                          style: GoogleFonts.jost(
                            fontSize: 7.5,
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.w400,
                            color: user.isPremium
                                ? const Color(0xFF7A6F66)
                                : const Color(0xFF9C9890),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.48),
             Padding(
  padding: const EdgeInsets.only(right: 20.0),
  child: Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Expanded(
      child: Container(
        height: 0.9,
        color: const Color(0xFF9D9890).withOpacity(0.14),
      ),
    ),
    const SizedBox(width: 8),
    Text(
      user.memberText,
      style: GoogleFonts.jost(
        fontSize: 10,
        color: const Color(0xFF9D9890),
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
      ),
    ),
    const SizedBox(width: 8),
    Expanded(
      child: Container(
        height: 0.9,
        color: const Color(0xFF9D9890).withOpacity(0.14),
      ),
    ),
  ],
),
),
              ],
            ),
          ),
        ],
      ),
    );
  }
}