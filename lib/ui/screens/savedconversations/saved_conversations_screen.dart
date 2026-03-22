import 'package:conversation_app/providers/SavedConversationsProvider/saved_conversations_provider.dart';
import 'package:conversation_app/widgets/saved_conversations/saved_conversations_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavedConversationsScreen extends StatelessWidget {
  const SavedConversationsScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SavedConversationsProvider(),
      child: const SavedConversationsView(),
    );
  }
}