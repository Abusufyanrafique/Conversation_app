import 'package:conversation_app/models/card_model.dart';
import 'package:flutter/material.dart';


class CardFocusScreenProvider extends ChangeNotifier {
  int _currentIndex = 0;
  final List<bool> _flippedStates;
  final PageController pageController = PageController();

  CardFocusScreenProvider() : _flippedStates = List.filled(cardData.length, false);

  int get currentIndex => _currentIndex;
  int get totalCards => cardData.length;
  List<CardModel> get cards => cardData;
  bool isFlipped(int index) => _flippedStates[index];

  void flipCard(int index) {
    _flippedStates[index] = !_flippedStates[index];
    notifyListeners();
  }

  void goToNext() {
    if (_currentIndex < cardData.length - 1) {
      _currentIndex++;
      pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  void goToPrevious() {
    if (_currentIndex > 0) {
      _currentIndex--;
      pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  void onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  bool get canGoNext => _currentIndex < cardData.length - 1;
  bool get canGoPrevious => _currentIndex > 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}