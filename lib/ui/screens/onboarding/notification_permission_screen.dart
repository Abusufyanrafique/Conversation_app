import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/providers/OnboardingProvider/notification_provider.dart';
import 'package:conversation_app/ui/screens/onboarding/all_set_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:conversation_app/Utils/app_textstyles.dart';
import 'package:conversation_app/widgets/onboarding_widget/notification_card_widget.dart';

class NotificationPermissionScreen extends StatelessWidget {
  const NotificationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NotificationProvider>();

    return Scaffold(
      backgroundColor: const Color(0xFF2B2622),
      body: SafeArea(
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              // ── Notification Card ──
              const NotificationCardWidget(),

              const SizedBox(height: 48),

              // ── Label ──
              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Text(
                  AppText.reminder,
                  style: AppTextStyles.jost(
                    fontSize: 10,
                    color: Color(0xFF9C9590),
                    letterSpacing: 2.8,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ── Heading ──
              Padding(
                padding: const EdgeInsets.only(left: 19.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppText.letusbring,
                        style: AppTextStyles.jost(
                          fontSize: 44,
                          color: Color(0xFFEFE7DE),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: 'day.',
                        style: AppTextStyles.jost(
                          fontSize: 44,
                          color: Color(0xFF9C9590),
                          fontWeight: FontWeight.w300,
                        ).copyWith(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 23),

              // ── Subtitle ──
              Padding(
                padding: const EdgeInsets.only(left: 19.0),
                child: Text(
                  AppText.oneday,
                  style: AppTextStyles.jost(
                    fontSize: 18,
                    color: Color(0xFF9C9590),
                    fontWeight: FontWeight.w300,                 
                  ).copyWith(fontStyle: FontStyle.italic),
                ),
              ),

              const Spacer(),

              // ── Allow Button ──
              GestureDetector(
                onTap: provider.isLoading
                    ? null
                    : () async {
                        await context
                            .read<NotificationProvider>()
                            .allowNotification();
                        if (context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const AllSetScreen(),
                            ),
                          );
                        }
                      },
                child: AnimatedContainer(
  duration: const Duration(milliseconds: 250),
  width: double.infinity,
  height: 56,
  decoration: BoxDecoration(
    color: const Color(0xFF2B2622).withOpacity(0.03),
    borderRadius: BorderRadius.circular(14),
    border: Border.all(
      color: const Color(0xFF524C47).withOpacity(0.66),
      width: 1,
    ),
  ),
  alignment: Alignment.center,
  child: provider.isLoading
      ? const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: Colors.white54,
            strokeWidth: 2,
          ),
        )
      : Text(
          AppText.notification,
          style: AppTextStyles.jost(
            fontSize: 12,
            color: Colors.white,
            letterSpacing: 2.16,
            fontWeight: FontWeight.w400,
          ),
        ),
),
              ),

              const SizedBox(height: 16),

              // ── Not Now ──
              GestureDetector(
                onTap: () {
                  context.read<NotificationProvider>().skipNotification();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AllSetScreen(),
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    AppText.notnow,
                    style: AppTextStyles.jost(
                      fontSize: 10,
                      color: Color(0xFF9C9590),
                      letterSpacing: 2.8,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

            ],
          ),
        ),
      ),
    );
  }
}