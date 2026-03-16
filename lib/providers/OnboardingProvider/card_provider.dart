import 'package:flutter/material.dart';

class CardProvider with ChangeNotifier {
  bool _isRevealed = false;

  bool get isRevealed => _isRevealed;

  void toggleCard() {
    _isRevealed = !_isRevealed;
    notifyListeners();
  }

  void resetCard() {
    _isRevealed = false;
    notifyListeners();
  }
}