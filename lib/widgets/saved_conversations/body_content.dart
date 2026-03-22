import 'package:conversation_app/providers/SavedConversationsProvider/saved_conversations_provider.dart';
import 'package:conversation_app/widgets/saved_conversations/conversation_list.dart';
import 'package:conversation_app/widgets/saved_conversations/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({super.key});
 
  @override
  Widget build(BuildContext context) {
    final isEmpty =
        context.watch<SavedConversationsProvider>().isEmpty;
 
    if (isEmpty) {
      return const EmptyState();
    }
    return const ConversationList();
  }
}