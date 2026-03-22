 
import 'package:conversation_app/models/saved_conversation/saved_conversation.dart';
import 'package:flutter/material.dart';

class SavedConversationsProvider extends ChangeNotifier {
  final List<SavedConversation> _savedConversations = [];
 
  List<SavedConversation> get savedConversations =>
      List.unmodifiable(_savedConversations);
 
  int get cardCount => _savedConversations.length;
 
  bool get isEmpty => _savedConversations.isEmpty;
 
  void saveConversation(SavedConversation conversation) {
    _savedConversations.add(conversation);
    notifyListeners();
  }
 
  void removeConversation(String id) {
    _savedConversations.removeWhere((c) => c.id == id);
    notifyListeners();
  }
 
  bool isSaved(String id) => _savedConversations.any((c) => c.id == id);
}