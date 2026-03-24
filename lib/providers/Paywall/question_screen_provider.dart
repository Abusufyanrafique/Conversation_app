import 'package:conversation_app/models/pay_wall/question_screen_model.dart';
import 'package:flutter/material.dart';

class QuestionScreenProvider extends ChangeNotifier {
  final PageController pageController = PageController();

  final List<QuestionScreenModel> cards = [
    QuestionScreenModel(
      title: "CARD 1  INTIMACY", 
      question: " What would you want me\n to truly understand about\n the way you love?"
      ),
    QuestionScreenModel(
      title: "CARD 2  INTIMACY", 
      question: "When do you feel most loved without any words at all?"
      ),
    QuestionScreenModel(
      title: "CARD 3  INTIMACY", 
      question: "What makes a great conversation memorable?"
      ),
  ];

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  int get totalCards => cards.length;
  QuestionScreenModel get currentCard => cards[_currentIndex];

  void nextPage(BuildContext context) {
    if (_currentIndex < cards.length - 1) {
      _currentIndex++;
      pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  void previousPage() {
    if (_currentIndex > 0) {
      _currentIndex--;
      pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  void onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}