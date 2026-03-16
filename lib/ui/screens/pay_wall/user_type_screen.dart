import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/providers/Paywall/user_type_screen_provider.dart';
import 'package:conversation_app/widgets/pay_wall/user_type_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final options = UserTypeScreenProvider.audienceOptions;

    return Scaffold(
      backgroundColor: const Color(0xFFF0E4DC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),

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
                      fontSize:9.8,
                      letterSpacing:2,
                      color: const Color(0xFF7A6F66),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Title
              RichText(
                textAlign: TextAlign.center,
                text:TextSpan(
                  children: [
                    TextSpan(
                      text: 'Who are you\n',
                     style: GoogleFonts.jost(
                      fontSize:30,
                      color: const Color(0xFF2B2622),
                      fontWeight: FontWeight.w300,
                    ),
                    ),
                    TextSpan(
                      text: 'talking with?',
                      style: GoogleFonts.jost(
                      fontSize:30,
                      color: const Color(0xFF7A6F66),
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                    ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Subtitle
              Text(
                "We'll find questions that feel right for this moment",
                textAlign: TextAlign.center,
                style: GoogleFonts.jost(
                      fontSize:16,
                      color: const Color(0xFF6B6460),
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                    ),
              ),

              const SizedBox(height: 20),

              // Grid of cards
              Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return UserTypeCardWidget(option: options[index]);
                  },
                ),
              ),

              const SizedBox(height: 16),

              // CTA Button
              Consumer<UserTypeScreenProvider>(
                builder: (context, provider, _) {
                  final hasSelection = provider.hasSelection;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: double.infinity,
                    height: 52,
                    decoration: BoxDecoration(
                      color: hasSelection
                          ? const Color(0xFF2C2C2C)
                          : Color(0xFFEFE7DE),
                      borderRadius: BorderRadius.circular(15.87),
                      border: Border.all(
                        color: const Color(0xFFFFFFFF),
                        width: 1.5,
                      ),
                    ),
                    child: TextButton(
                      onPressed: hasSelection
                          ? () {
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
                      fontSize:12,
                      color: hasSelection
                          ? const Color(0xFFF5F0EB)
                          : Color(0xFF2B2622),
                      letterSpacing: 2.16,
                      fontWeight: FontWeight.w400,
                    ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}