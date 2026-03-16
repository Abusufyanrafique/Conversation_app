import 'package:flutter/material.dart';

class AllSetProvider extends ChangeNotifier {
  bool _isReady = false;

  bool get isReady => _isReady;

  void markReady() {
    _isReady = true;
    notifyListeners();
  }

  void drawFirstCard() {
    // TODO: home screen navigate karo
    notifyListeners();
  }
}