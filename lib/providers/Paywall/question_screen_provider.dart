import 'package:conversation_app/models/pay_wall/question_screen_model.dart';
import 'package:flutter/material.dart';

class QuestionScreenProvider extends ChangeNotifier {

  int _currentIndex = 0;

  final PageController pageController = PageController();

  final List<QuestionScreenModel> _cards = [
    QuestionScreenModel(
      title: "CARD 1 • INTIMACY",
      question:
          "What would you want me to truly understand about the way you love?",
    ),
    QuestionScreenModel(
      title: "CARD 2 • INTIMACY",
      question:
          "When do you feel most loved without any words at all?",
    ),
  ];

  
  List<QuestionScreenModel> get cards => _cards;

  int get currentIndex => _currentIndex;

  QuestionScreenModel get currentCard => _cards[_currentIndex];

  int get totalCards => _cards.length;

  void onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void nextCard() {
    if (_currentIndex < _cards.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void previousCard() {
    if (_currentIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }
}