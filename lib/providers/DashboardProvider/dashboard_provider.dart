import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  int _currentIndex = 0;

  // Current selected tab index getter
  int get currentIndex => _currentIndex;

  // Tab change karne ka function
  void setIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners(); // UI ko update karo
    }
  }
}