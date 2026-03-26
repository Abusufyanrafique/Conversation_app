import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/models/library/deck_category.dart';
import 'package:flutter/material.dart';

class LibraryProvider extends ChangeNotifier {
  bool _isPremium = false;
 
  bool get isPremium => _isPremium;
 
  void togglePlan() {
    _isPremium = !_isPremium;
    notifyListeners();
  }
 
  List<DeckCategory> get categories => [
        DeckCategory(
          title: 'Couples',
          cardCount: _isPremium ? 43 : 14,
          description: 'Questions for partners ready to go a little deeper than usual.',
          color:  Color(0xFFBA8982).withOpacity(0.8),
          icon: Icons.bookmark_border,
          tags: _isPremium ? ['Intimacy', 'Deep Intimacy', 'All open'] : ['Intimacy', 'Deep Intimacy'],
          deckCount: 3,
          isPremium: _isPremium,
          imagepath: AppImages.couples,
        ),
        DeckCategory(
          title: 'Friends',
          cardCount: _isPremium ? 54 : 20,
          description: 'Questions for partners ready to go a little deeper than usual.',
          color:  Color(0xFFA2B69C),
          icon: Icons.people_outline,
          tags: _isPremium ? ['Presence', 'Friendship', 'All open'] : ['Presence', 'Friendship'],
          deckCount: 3,
          isPremium: _isPremium, imagepath: AppImages.person,
        ),
        DeckCategory(
          title: 'Family',
          cardCount: _isPremium ? 49 : 17,
          description: 'Questions for partners ready to go a little deeper than usual.',
          color: const Color(0xFFD1BA9E),
          icon: Icons.home_outlined,
          tags: _isPremium ? ['Siblings', 'Generations', 'All open'] : ['Siblings', 'Generations'],
          deckCount: 2,
          isPremium: _isPremium, imagepath:AppImages.home,
        ),
        DeckCategory(
          title: 'Self',
          cardCount: _isPremium ? 47 : 14,
          description: 'Questions for partners ready to go a little deeper than usual.',
          color: const Color(0xFFA0AEC0),
          icon: Icons.person_outline,
          tags: _isPremium ? ['Reflection', 'Growth', 'All open'] : ['Reflection', 'Growth'],
          deckCount: 2,
          isPremium: _isPremium, imagepath:AppImages.self,
        ),
      ];
}