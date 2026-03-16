import 'package:conversation_app/providers/OnboardingProvider/onboarding_provider.dart';
import 'package:conversation_app/ui/screens/onboarding/draw_card_screen.dart';
import 'package:conversation_app/ui/screens/onboarding/notification_permission_screen.dart';
import 'package:conversation_app/ui/screens/onboarding/onboarding_indicator.dart';
import 'package:conversation_app/ui/screens/onboarding/onboarding_screen1.dart';
import 'package:conversation_app/ui/screens/onboarding/who_are_you_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  // ── Har screen ka background color ──
  final List<Color> _pageColors = const [
    Color(0xFFEFE7DE), // OnboardingScreen1
    Color(0xFFEFE7DE), // Draw_Card_Screen
    Color(0xFFEFE7DE), // WhoAreYouScreen
    Color(0xFF2B2622), // NotificationPermissionScreen
    Color(0xFF2B2622), // Page 3
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onboardingProvider = context.watch<OnboardingProvider>();
     final currentColor = _pageColors[onboardingProvider.currentPage];
    final pages = const [
      OnboardingScreen1(),
     Draw_Card_Screen(),
     WhoAreYouScreen(),
     NotificationPermissionScreen(),
    //  AllSetScreen(),
      Center(child: Text('Page 3', style: TextStyle(fontSize: 32))),
    ];

    return Scaffold(
       backgroundColor: currentColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                physics: const AlwaysScrollableScrollPhysics(),
                onPageChanged: (index) {
                  onboardingProvider.updatePage(index);
                },
                itemBuilder: (context, index) => pages[index],
              ),
            ),
            const SizedBox(height: 16),
            OnboardingIndicator(
              currentPage: onboardingProvider.currentPage,
              pageCount: pages.length,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
