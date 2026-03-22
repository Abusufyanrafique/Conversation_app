import 'package:conversation_app/Utils/app_colors.dart';
import 'package:conversation_app/widgets/saved_conversations/body_content.dart';
import 'package:conversation_app/widgets/saved_conversations/meta_row.dart';
import 'package:conversation_app/widgets/saved_conversations/top_bar.dart';
import 'package:flutter/material.dart';

class SavedConversationsView extends StatelessWidget {
  const SavedConversationsView({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundscreencolor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TopBar(),
            SizedBox(height: 28,),
            MetaRow(),
            SizedBox(height: 28,),
            Expanded(
              child: BodyContent(),
              ),
          ],
        ),
      ),
    );
  }
}
 