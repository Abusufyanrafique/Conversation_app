import 'package:conversation_app/widgets/profile/free_plan_widgets/bottom_pills.dart';
import 'package:conversation_app/widgets/profile/free_plan_widgets/compare_plans.dart';
import 'package:conversation_app/widgets/profile/free_plan_widgets/current_plan_card.dart';
import 'package:conversation_app/widgets/profile/free_plan_widgets/footer_widget.dart';
import 'package:conversation_app/widgets/profile/free_plan_widgets/plan_toggle.dart';
import 'package:conversation_app/widgets/profile/free_plan_widgets/restore_button.dart';
import 'package:conversation_app/widgets/profile/free_plan_widgets/subscription_app_bar.dart';
import 'package:conversation_app/widgets/profile/free_plan_widgets/unlock_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FreePlanScreen extends StatefulWidget {
  const FreePlanScreen({super.key});

  @override
  State<FreePlanScreen> createState() => _FreePlanScreenState();
}

class _FreePlanScreenState extends State<FreePlanScreen> {
  bool isAnnual = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFE7DE),
      body: SafeArea(
        child: Column(
          children: [
            const SubscriptionAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const CurrentPlanCard(),
                    const SizedBox(height: 28),
                    _sectionLabel('CHOOSE YOUR PLAN'),
                    const SizedBox(height: 12),
                    PlanToggle(
                      isAnnual: isAnnual,
                      onChanged: (val) => setState(() => isAnnual = val),
                    ),
                    const SizedBox(height: 28),
                    _sectionLabel('COMPARE PLANS'),
                    const SizedBox(height: 12),
                    const ComparePlans(),
                    const SizedBox(height: 28),
                    UnlockButton(isAnnual: isAnnual),
                    const SizedBox(height: 12),
                    const RestoreButton(),
                    const SizedBox(height: 20),
                    const BottomPills(),
                    const SizedBox(height: 16),
                    const FooterWidget(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String label) {
    return Text(
      label,
      style: GoogleFonts.jost(
        fontSize: 10,
        color: const Color(0xFF7A6F66),
        letterSpacing: 2.28,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}