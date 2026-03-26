import 'package:conversation_app/Utils/app_colors.dart';
import 'package:conversation_app/providers/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    final user = provider.user;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting + Name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.greeting.toUpperCase(),
                  style: GoogleFonts.jost(
                    letterSpacing: 2.09,
                    fontSize: 10,
                    color: AppColors.homeeveningtext,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 6),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${user.firstName} ',
                        style: GoogleFonts.jost(
                          fontSize: 22,
                          color: AppColors.homemayatext,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: user.lastName,
                        style: GoogleFonts.jost(
                          fontSize: 22,
                          color: AppColors.homeeveningtext,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Plan badge + Avatar
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 4),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => provider.onPlanBadgeTapped(),
                    child: _PlanBadge(isPremium: provider.isPremiumView),
                  ),
                  const SizedBox(width: 11),
                  _AvatarCircle(initial: user.avatarInitial),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Plan Badge ──────────────────────────────────────────
class _PlanBadge extends StatelessWidget {
  final bool isPremium;
  const _PlanBadge({required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.planbage,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.planbage,
          width: 0.98,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.dotcolor,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            isPremium ? 'PREMIUM' : 'FREE PLAN',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.3,
              color: AppColors.planbagetextcolor,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Avatar Circle ───────────────────────────────────────
class _AvatarCircle extends StatelessWidget {
  final String initial;
  const _AvatarCircle({required this.initial});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: AppColors.dotcolor,
      ),
      alignment: Alignment.center,
      child: Text(
        initial,
        style: GoogleFonts.cormorantGaramond(
          color: Colors.white,
          fontSize: 13.29,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}