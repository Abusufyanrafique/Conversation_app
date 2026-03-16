import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/providers/OnboardingProvider/all_set_provider.dart';
import 'package:conversation_app/ui/screens/card_interaction/deep_intimacy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:conversation_app/Utils/app_textstyles.dart';
import 'package:conversation_app/widgets/onboarding_widget/gradient_border_container.dart';

class AllSetScreen extends StatelessWidget {
  const AllSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF2B2622),
      body: Stack(
        children: [
          /// Background Circle
          Positioned(
            top: size.height * 0.28,
            left: size.width * 0.03,
            right: size.width * 0.03,
            child: Container(
              height: size.height * 0.36,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF3D3630),
              ),
            ),
          ),

          /// Main Content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.25),

                    /// App Icon
                    Container(
                      height: size.width * 0.10,
                      width: size.width * 0.10,
                      decoration: BoxDecoration(
                        color: const Color(0xFF9C9590),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF9C9590),
                          width: 2,
                        ),
                      ),
                      child: const Image(
                        image: AssetImage(AppImages.couples),
                      ),
                    ),

                    SizedBox(height: size.height * 0.05),

                    /// You're all set
                    Text(
                      AppText.youare,
                      style: AppTextStyles.jost(
                        fontSize: size.width * 0.08,
                        color: const Color(0xFFEFE7DE),
                        fontWeight: FontWeight.w300,
                      ),
                    ),

                    SizedBox(height: size.height * 0.015),

                    /// Let's begin
                    Text(
                      AppText.lets,
                      style: AppTextStyles.jost(
                        fontSize: size.width * 0.07,
                        color: const Color(0xFF9C9590),
                        fontWeight: FontWeight.w300,
                      ).copyWith(fontStyle: FontStyle.italic),
                    ),

                    SizedBox(height: size.height * 0.035),

                    /// Subtitle
                    Text(
                      AppText.yourfirstcard,
                      style: AppTextStyles.jost(
                        fontSize: size.width * 0.03,
                        color: const Color(0xFFEFE7DE),
                        letterSpacing: 2.16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: size.height * 0.03),

                    /// Draw Button
                    SizedBox(
                      width: size.width * 0.70,
                      child: GradientBorderContainer(
                        borderRadius: 16,
                        borderWidth: 1,
                        child: GestureDetector(
                          onTap: () {
                          //  navigatee
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => 
                            const DeepIntimacy()
                            ),
                           );
                            context.read<AllSetProvider>().drawFirstCard();
                          },
                          child: Container(
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                          color: const Color(0xFF2B2622),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                          color: const Color(0xFF524C47).withOpacity(0.66),
                          width: 1,
    ),
  ),
                     alignment: Alignment.center,
                      child: Text(
                      AppText.drawyourcard,
                      style: AppTextStyles.jost(
                      fontSize: size.width * 0.032,
                      color: Colors.white,
                      letterSpacing: 2.16,
                      fontWeight: FontWeight.w400,
    ),
  ),
),
                        ),
                      ),
                    ),

                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}