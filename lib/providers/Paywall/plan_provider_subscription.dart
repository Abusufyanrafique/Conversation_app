import 'package:flutter/material.dart';
// ─────────────────────────────────────────
//   STATE  (Provider)
// ─────────────────────────────────────────
enum BillingCycle { monthly, yearly }
 
class PricingProviderSubscription extends ChangeNotifier {
  BillingCycle _selected = BillingCycle.monthly;
 
  BillingCycle get selected => _selected;
 
  void select(BillingCycle cycle) {
    if (_selected != cycle) {
      _selected = cycle;
      notifyListeners();
    }
  }
}