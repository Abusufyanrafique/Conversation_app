// lib/providers/OnboardingProvider/who_are_you_provider.dart

import 'package:flutter/material.dart';

class WhoAreYouProvider extends ChangeNotifier {
  
  // ── Selected deck index track karo ──
  int? _selectedIndex;
  int? get selectedIndex => _selectedIndex;

  bool get hasSelection => _selectedIndex != null;

  // ── Deck select/deselect ──
  void selectDeck(int index) {
    if (_selectedIndex == index) {
      _selectedIndex = null; // deselect
    } else {
      _selectedIndex = index; // select
    }
    notifyListeners();
  }

  // ── Check karo specific index selected hai ya nahi ──
  bool isSelected(int index) => _selectedIndex == index;

  // ── Reset ──
  void reset() {
    _selectedIndex = null;
    notifyListeners();
  }
}