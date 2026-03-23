import 'package:conversation_app/Utils/app_colors.dart';
import 'package:conversation_app/providers/home/home_provider.dart';
import 'package:conversation_app/widgets/home/home_header.dart';
import 'package:conversation_app/widgets/home/personal_prompt_section.dart';
import 'package:conversation_app/widgets/home/saved_moments_section.dart';
import 'package:conversation_app/widgets/home/stats_row.dart';
import 'package:conversation_app/widgets/home/todaycard_section.dart';
import 'package:conversation_app/widgets/home/unlock_banner.dart';
import 'package:conversation_app/widgets/home/your_decks_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: const _HomeContent(),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    final date = context.watch<HomeProvider>().user.date;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ─────────────────────────────
              const HomeHeader(),
              const SizedBox(height: 6),

              // ── Date ───────────────────────────────
             Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Row(
    children: [
      Text(
        date,
        style: GoogleFonts.jost(
          fontSize: 12,
          letterSpacing: 0.52,
          color: AppColors.datetextcolor,
        ),
      ),
      const SizedBox(width: 10),
      // Divider
      Expanded(
            child: Container(
              height: 0.98,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0x2E9E9890), // #9E98902E - 18% opacity
                    Color(0x009E9890), // #9E989000 - 0% opacity
                  ],
                ),
              ),
            ),
          ),
    ],
  ),
),
              const SizedBox(height: 16),

              // ── Today's Card ────────────────────────
              const TodayCardSection(),
              const SizedBox(height: 20),

              // ── Stats ───────────────────────────────
              const StatsRow(),
              const SizedBox(height: 24),

              // ── Personal Prompt ─────────────────────
              const PersonalPromptSection(),
              const SizedBox(height: 24),

              // ── Your Decks ──────────────────────────
              const YourDecksSection(),
              const SizedBox(height: 20),

              // ── Unlock Banner ───────────────────────
              const UnlockBanner(),
              const SizedBox(height: 24),

              // ── Saved Moments ───────────────────────
              const SavedMomentsSection(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

