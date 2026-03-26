import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/models/home/user_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  // ── User ──────────────────────────────────────────────
  final UserModel user = const UserModel(
    greeting: 'Good Evening',
    firstName: 'Maya',
    lastName: 'Sinclair.',
    date: 'Monday, February 23',
    isPremium: false,
    avatarInitial: 'M',
  );

  // ── Today's Card ──────────────────────────────────────
  TodayCardModel _todayCard = TodayCardModel(
    tag: 'Intimacy',
    quote: '"What would you want someone to truly understand about the way you love?"',
  );

  TodayCardModel get todayCard => _todayCard;

  void toggleSaved() {
    _todayCard.isSaved = !_todayCard.isSaved;
    notifyListeners();
  }

  void drawAnother() {
    final cards = [
      TodayCardModel(
        tag: 'Presence',
        quote: '"Today, notice a moment when you felt genuinely yourself. What made that possible?"',
      ),
      TodayCardModel(
        tag: 'Identity',
        quote: '"What belief have you been carrying that might actually be true?"',
      ),
      TodayCardModel(
        tag: 'Intimacy',
        quote: '"What would you want someone to truly understand about the way you love?"',
      ),
    ];
    final current = cards.indexWhere((c) => c.tag == _todayCard.tag);
    _todayCard = cards[(current + 1) % cards.length];
    notifyListeners();
  }

  // ── Stats ─────────────────────────────────────────────
  final List<StatModel> stats = const [
    StatModel(value: '14', label: 'Day Streak', sublabel: 'Keep going 🔥'),
    StatModel(value: '58', label: 'Cards Read', sublabel: 'Across decks'),
    StatModel(value: '9', label: 'Saved', sublabel: 'Favourite moments'),
  ];

  // ── Personal Prompt ───────────────────────────────────
  final String personalPrompt =
      '"Today, notice a moment when you felt genuinely yourself. What made that possible?"';

  // isPremiumView: false = free card, true = locked/blurred card
  bool _isPremiumView = false;
  bool get isPremiumView => _isPremiumView;

  void onPlanBadgeTapped() {
    _isPremiumView = !_isPremiumView;
    notifyListeners();
  }

  // ── Decks ─────────────────────────────────────────────
  final List<DeckModel> decks = const [
    DeckModel(
      id: '1', 
      title: 'Intimacy',   
      cardCount: '32 cards', 
      colorHex: '#C2857B', 
      imagePath: AppImages.couples
      ),
    DeckModel(
      id: '2', 
      title: 'Presence',   
      cardCount: '27 cards', 
      colorHex: '#8FAF9A', 
      imagePath: AppImages.person
      ),
    DeckModel(
      id: '3', 
      title: 'Family',     
      cardCount: '24 cards', 
      colorHex: '#D4A97A', 
      imagePath: AppImages.home
      ),
    DeckModel(
      id: '4', 
      title: 'Self',       
      cardCount: '30 cards', 
      colorHex: '#B4BAC6', 
      imagePath: AppImages.self
      ),
    DeckModel(
      id: '5', 
      title: 'Identity',   
      cardCount: '18 cards', 
      colorHex: '#B5A8CC', 
      imagePath: AppImages.team
      ),
    DeckModel(
      id: '6', 
      title: 'New People', 
      cardCount: '22 cards', 
      colorHex: '#B8A99A', 
      imagePath: AppImages.emoji
      ),
  ];

  // ── Saved Moments ─────────────────────────────────────
  final List<SavedMomentModel> savedMoments = const [
    SavedMomentModel(quote: '"What would you want someone to truly understand about the way you love?"'),
    SavedMomentModel(quote: '"What belief have you been carrying that might actually be true?"'),
  ];
}