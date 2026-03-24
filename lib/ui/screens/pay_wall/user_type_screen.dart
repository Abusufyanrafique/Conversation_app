import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/providers/Paywall/user_type_screen_provider.dart';
import 'package:conversation_app/ui/screens/pay_wall/question_screen.dart';
import 'package:conversation_app/widgets/pay_wall/user_type_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final options = UserTypeScreenProvider.audienceOptions;
    final size = MediaQuery.of(context).size;
    final h = size.height;

    final isSmall  = h < 680;
    final isMedium = h < 800;

    double sp(double val) {
      if (isSmall)  return val * 0.45;
      if (isMedium) return val * 0.72;
      return val;
    }

    double titleSize() {
      if (isSmall)  return 22;   // 30 → 22
      if (isMedium) return 26;   // 30 → 26
      return 30;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF0E4DC),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: sp(12),                     // was: 12
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: sp(8)),             // was: 8

              // Step indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Color(0xFF3A3A3A),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    AppText.step,
                    style: GoogleFonts.jost(
                      fontSize: 9.8,
                      letterSpacing: 2,
                      color: const Color(0xFF7A6F66),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              SizedBox(height: sp(16)),            // was: 16

              // Title
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppText.whoareyoun,
                      style: GoogleFonts.jost(
                        fontSize: titleSize(),
                        color: const Color(0xFF2B2622),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: AppText.talkingwith,
                      style: GoogleFonts.jost(
                        fontSize: titleSize(),
                        color: const Color(0xFF7A6F66),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: sp(10)),            // was: 10

              // Subtitle
              Text(
                AppText.feelmoment,
                textAlign: TextAlign.center,
                style: GoogleFonts.jost(
                  fontSize: isSmall ? 12 : 14,     // was: fixed 14
                  color: const Color(0xFF6B6460),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                ),
              ),

              SizedBox(height: sp(20)),            // was: 20

              // Grid of cards
              Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: isSmall ? 1.3 : 1.1,  // was: fixed 1.1
                  ),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return UserTypeCardWidget(option: options[index]);
                  },
                ),
              ),

              SizedBox(height: sp(16)),            // was: 16

              // CTA Button
              Consumer<UserTypeScreenProvider>(
                builder: (context, provider, _) {
                  final hasSelection = provider.hasSelection;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: double.infinity,
                    height: isSmall ? 44 : 52,     // was: fixed 52
                    decoration: BoxDecoration(
                      color: hasSelection
                          ? const Color(0xFF2B2622)
                          : const Color(0xFFEFE7DE),
                      borderRadius: BorderRadius.circular(15.87),
                      border: Border.all(
                        color: const Color(0xFFFFFFFF),
                        width: 1.5,
                      ),
                    ),
                    child: TextButton(
                      onPressed: hasSelection
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const QuestionScreen(),
                                ),
                              );
                              final selected = provider.getSelectedOption(options);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Starting with: ${selected?.title ?? ""}',
                                    style: const TextStyle(fontFamily: 'Georgia'),
                                  ),
                                  backgroundColor: const Color(0xFF2C2C2C),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              );
                            }
                          : null,
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.87),
                        ),
                      ),
                      child: Text(
                        AppText.startwithtwofree,
                        style: GoogleFonts.jost(
                          fontSize: 12,
                          color: hasSelection
                              ? const Color(0xFFF5F0EB)
                              : const Color(0xFF2B2622),
                          letterSpacing: 2.16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}