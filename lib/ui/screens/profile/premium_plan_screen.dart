import 'package:conversation_app/widgets/profile/free_plan_widgets/bottom_pills.dart';
import 'package:conversation_app/widgets/profile/free_plan_widgets/compare_plans.dart';
import 'package:conversation_app/widgets/profile/free_plan_widgets/subscription_app_bar.dart';
import 'package:conversation_app/widgets/profile/premium_plan_widgets/action_buttons_section.dart';
import 'package:conversation_app/widgets/profile/premium_plan_widgets/current_plan_card.dart';
import 'package:conversation_app/widgets/profile/premium_plan_widgets/footer_section.dart';
import 'package:flutter/material.dart';
class PremiumPlanScreen extends StatelessWidget {
  const PremiumPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFE7DE),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 18, 
          vertical: 15
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 40,),
            SubscriptionAppBar(),
            PremiumCurrentPlanCard(),
            SizedBox(height: 28),
          ComparePlans(),
            SizedBox(height: 28),
            ActionButtonsSection(),
            SizedBox(height: 17,),
            BottomPills(),
            SizedBox(height: 17),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}