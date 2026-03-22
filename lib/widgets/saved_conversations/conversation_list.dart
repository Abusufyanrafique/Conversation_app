import 'package:conversation_app/providers/SavedConversationsProvider/saved_conversations_provider.dart';
import 'package:conversation_app/widgets/saved_conversations/conversation_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversationList extends StatelessWidget {
  const ConversationList({super.key});

  @override
  Widget build(BuildContext context) {
    final conversations =
        context.watch<SavedConversationsProvider>().savedConversations;

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      itemCount: conversations.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final item = conversations[index];
        return SavedConversationCard(conversation: item); 
      },
    );
  }
}