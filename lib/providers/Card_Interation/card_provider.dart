import 'package:conversation_app/models/conversation_card.dart';
import 'package:flutter/material.dart';


class CardProvider extends ChangeNotifier {
  // Replace imagePath values with your actual asset paths
  final List<ConversationCard> _cards = const [
    ConversationCard(
      id: 1,
      question: "What would you want me to truly understand about the way you love?",
      imagePath: 'assets/images/card_interation/swipe_card1.png', 
      height:320, 
      width:246 , 
      angle:20 , 
     
    ),
    ConversationCard(
      id: 2,
      question: "What moment in your life shaped who you are the most?",
      imagePath: 'assets/images/card_interation/swipe_card2.png', 
      height:320 , 
      width: 346, 
      angle: null, 
      
    ),
    ConversationCard(
      id: 3,
      question: "What is something you wish people asked you more often?",
      imagePath: 'assets/images/card_interation/swipe_card3.png', 
      height: 320, 
      width: 346, 
      // angle: null, 
      
    ),
    ConversationCard(
      id: 4,
      question: "What does a perfect day look like for you?",
      imagePath: 'assets/images/card_interation/swipe_card4.png', 
      height: 320, 
      width: 346, 
      // angle: null, 
     
    ),
  ];

  int _currentIndex = 0;
  bool _isFocusMode = false;
  bool _isCardFlipped = false;
  bool _isAnimating = false;

  // ─── Getters ───────────────────────────────────────────
  List<ConversationCard> get cards => _cards;
  int get currentIndex => _currentIndex;
  int get totalCards => _cards.length;
  bool get isFocusMode => _isFocusMode;
  bool get isCardFlipped => _isCardFlipped;
  bool get isAnimating => _isAnimating;
  bool get isFirstCard => _currentIndex == 0;
  bool get isLastCard => _currentIndex == _cards.length - 1;

  ConversationCard get currentCard => _cards[_currentIndex];

  // Cards visible in the deck (current + next for stacked look)
  List<ConversationCard> get visibleDeckCards {
    final result = <ConversationCard>[];
    for (int i = _currentIndex;
        i < _currentIndex + 3 && i < _cards.length;
        i++) {
      result.add(_cards[i]);
    }
    return result;
  }

  // ─── Actions ───────────────────────────────────────────
  void nextCard() {
    if (!isLastCard && !_isAnimating) {
      _isAnimating = true;
      _isCardFlipped = false;
      notifyListeners();

      Future.delayed(const Duration(milliseconds: 400), () {
        _currentIndex++;
        _isAnimating = false;
        notifyListeners();
      });
    }
  }

  void previousCard() {
    if (!isFirstCard && !_isAnimating) {
      _isAnimating = true;
      _isCardFlipped = false;
      notifyListeners();

      Future.delayed(const Duration(milliseconds: 400), () {
        _currentIndex--;
        _isAnimating = false;
        notifyListeners();
      });
    }
  }

  void flipCard() {
    _isCardFlipped = !_isCardFlipped;
    notifyListeners();
  }

  void toggleFocusMode() {
    _isFocusMode = !_isFocusMode;
    notifyListeners();
  }

  void exitFocusMode() {
    _isFocusMode = false;
    notifyListeners();
  }
}