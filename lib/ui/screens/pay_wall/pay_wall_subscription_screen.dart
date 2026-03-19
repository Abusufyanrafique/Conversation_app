import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/providers/Paywall/plan_provider_subscription.dart';
import 'package:conversation_app/widgets/pay_wall/header_section.dart';
import 'package:conversation_app/widgets/pay_wall/pricing_plan_tile.dart';
import 'package:conversation_app/widgets/pay_wall/unlimited_conversation_card.dart';
import 'package:conversation_app/widgets/pay_wall/unlock_access_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ================= SCREEN =================
class PaywallSubscriptionScreen extends StatelessWidget {
  const PaywallSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFE7DE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // HEADER
                const HeaderSection(),

                const SizedBox(height: 40),

                // TITLE
                Center(
                  child: Text(
                    AppText.everything,
                    style: GoogleFonts.jost(
                      fontSize: 9,
                      letterSpacing: 2.9,
                      color: const Color(0xFFA09890),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // BOX
                

                const SizedBox(height: 20),

                // CARDS
                UnlimitedConversationCard(
                  title:AppText.unlimitedconversation,
                  subtitle:AppText.accesseveryquestion,
                  imagepath: AppImages.oo,
                  isChecked: true,
                ),
                SizedBox(height: 8,),
                UnlimitedConversationCard(
                  title: AppText.exclusivedeepconnection,
                  subtitle: AppText.intimacyhealing,
                  imagepath: AppImages.exclusiveimage,
                  isChecked: true,
                ),
                 SizedBox(height: 8,),
                UnlimitedConversationCard(
                  title: AppText.favouritemoments,
                  subtitle:AppText.bookmarkcards,
                  imagepath: AppImages.blackheart,
                  isChecked: true,
                ),
                 SizedBox(height: 8,),
                UnlimitedConversationCard(
                  title: AppText.personalizeddailyprompts,
                  subtitle: AppText.gentlequestion,
                  imagepath: AppImages.daimondicon,
                  isChecked: true,
                ),

                const SizedBox(height: 24),
                 Center(
                   child: Container(
                    width:325,
                    height: 72.22,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: const Color(0x0A2B2622),
                      border: Border.all(
                        color: Colors.white, 
                        width:0.96,
                        ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 21.0, 
                        right: 12
                        ),
                      child: Text(
                        AppText.mattermost,
                        style: GoogleFonts.jost(
                          fontSize: 13.3,
                          color: const Color(0xFF7A6F66),
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                                   ),
                 ),
                SizedBox(height: 24,),
  PricingPlanTile(
  cycle: BillingCycle.yearly,
  title: 'Monthly',
  description: 'Billed each month. Cancel any time, no questions asked.',
  price: '\$9.99',
  priceLabel: '/month',
  badge: '\$5.99/mo',
  onTap: () {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => const UnlockAccessBottomSheet(),
    );
  },
),

PricingPlanTile(
  cycle: BillingCycle.yearly,
  title: 'Yearly',
  description: 'Billed once a year. Two months free compared to monthly.',
  price: '\$71.88',
  priceLabel: '/year',
  badge: '\$5.99/mo',
  onTap: () {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => const UnlockAccessBottomSheet(),
    );
  },
),

                const SizedBox(height: 30),

               // Agar StatelessWidget mein ho toh:
      // Agar StatelessWidget mein ho toh:
                 const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ================= ACTION =================
class ActionSection extends StatelessWidget {
  const ActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 55),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {},
          child: const Text("UNLOCK FULL ACCESS"),
        ),
        const SizedBox(height: 10),
        const Text(
          "Maybe later",
          style: TextStyle(color: Colors.black45),
        ),
      ],
    );
  }
}