import 'package:flutter/material.dart';

enum PlanType { free, premium }

class UserProvider extends ChangeNotifier {
  final String _name = 'Maya';
  final String _lastName = 'Sinclair.';
  final String _email = 'maya.sinclair@gmail.com';
  PlanType _plan = PlanType.free;
  final String _memberSince = 'February 2025';
  bool _notificationsEnabled = true;

  // Journey stats
  int _decksCompleted = 2;
  int _cardsExplored = 47;
  int _questionsSaved = 9;

  // Getters
  String get name => _name;
  String get lastName => _lastName;
  String get email => _email;
  PlanType get plan => _plan;
  String get memberSince => _memberSince;
  bool get notificationsEnabled => _notificationsEnabled;
  bool get isPremium => _plan == PlanType.premium;
  int get decksCompleted => _decksCompleted;
  int get cardsExplored => _cardsExplored;
  int get questionsSaved => _questionsSaved;

  String get planLabel => isPremium ? 'PREMIUM PLAN' : 'FREE PLAN';
  String get memberText =>
      isPremium ? 'Premium since $memberSince' : 'Member since $memberSince';

  void togglePlan() {
    if (_plan == PlanType.free) {
      _plan = PlanType.premium;
      _decksCompleted = 7;
      _cardsExplored = 124;
      _questionsSaved = 31;
    } else {
      _plan = PlanType.free;
      _decksCompleted = 2;
      _cardsExplored = 47;
      _questionsSaved = 9;
    }
    notifyListeners();
  }

  void toggleNotifications() {
    _notificationsEnabled = !_notificationsEnabled;
    notifyListeners();
  }
}