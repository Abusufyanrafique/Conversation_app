import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _permissionGranted = false;

  bool get isLoading => _isLoading;
  bool get permissionGranted => _permissionGranted;

  Future<void> allowNotification() async {
    _isLoading = true;
    notifyListeners();

    // TODO: actual permission request yahan lagao
    await Future.delayed(const Duration(milliseconds: 800));

    _permissionGranted = true;
    _isLoading = false;
    notifyListeners();
  }

  void skipNotification() {
    _permissionGranted = false;
    notifyListeners();
  }
}