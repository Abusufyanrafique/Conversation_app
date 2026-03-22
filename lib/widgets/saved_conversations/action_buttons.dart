// ACTION BUTTONS
// ─────────────────────────────────────────────
 
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/widgets/saved_conversations/outlined_Btn.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedBtn(
          label: AppText.tapcard,
          onTap: () {},
        ),
        const SizedBox(width: 19),
        OutlinedBtn(
          label: AppText.broweslibrary,
          onTap: () {},
        ),
      ],
    );
  }
}