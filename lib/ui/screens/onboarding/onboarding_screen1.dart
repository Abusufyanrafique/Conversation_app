import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/Utils/app_textstyles.dart';
import 'package:conversation_app/providers/OnboardingProvider/onboarding_provider.dart';
import 'package:conversation_app/widgets/onboarding_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onboardingProvider = context.watch<OnboardingProvider>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFEFE7DE),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: Column(
            children: [

              /// Top spacing
              SizedBox(height: size.height * 0.04),

              /// Flower Image
              Image.asset(
                AppImages.onboardingflower,
                height: size.height * 0.28,
                fit: BoxFit.contain,
              ),

              SizedBox(height: size.height * 0.03),

              /// Content
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// Small Label
                    Padding(
                      padding: EdgeInsets.only(right: size.width * 0.07),
                      child: Text(
                        AppText.agentlerway,
                        style: AppTextStyles.jost(
                          fontSize: 10,
                          color: const Color(0xFF7A6F66),
                          letterSpacing: 2.8,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.015),

                    /// Heading
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: AppText.somewordstake,
                            style: AppTextStyles.jost(
                              fontSize: 44,
                              color: const Color(0xFF1C1B1A),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: AppText.courage,
                            style: AppTextStyles.jost(
                              fontSize: 44,
                              color: const Color(0xFF9C9590),
                              fontWeight: FontWeight.w300,
                            ).copyWith(fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text: AppText.speak,
                            style: AppTextStyles.jost(
                              fontSize: 44,
                              color: const Color(0xFF1C1B1A),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: size.height * 0.03),

                    /// Subtitle
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.0),
                      child: Text(
                        AppText.thesecardhplod,
                        style: AppTextStyles.jost(
                          fontSize: 18,
                          color: const Color(0xFF7A6F66),
                          fontWeight: FontWeight.w300,
                        ).copyWith(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              /// Begin Button
              CustomButton(
                text: "BEGIN",
                onTap: () {},
                useGradient: false,
                backgroundColor: const Color(0xffEFE7DE),
                textColor: const Color(0xFF1C1B1A),
              ),

              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}