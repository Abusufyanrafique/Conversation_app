import 'dart:async';
import 'package:conversation_app/ui/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {

  void startSplash(BuildContext context) {
    Timer(const Duration(seconds: 3), () {

Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => OnboardingScreen(),
  ),
);

    });
  }

}