// ─────────────────────────────────────────
// TAG ROW WIDGET
// ─────────────────────────────────────────
 
import 'package:conversation_app/widgets/library/tag_chip.dart';
import 'package:flutter/material.dart';

class TagRow extends StatelessWidget {
  final List<String> tags;
  final bool isPremium;
  final Color color;
 
  const TagRow({
    super.key,
    required this.tags,
    required this.isPremium,
    required this.color,
  });
 
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 2,
      runSpacing: 6,
      children: [
        ...tags.map((tag) => TagChip(
              label: tag,
             isLocked: !isPremium && tag != tags[0],
              color: color,
            )),
        if (!isPremium)
          TagChip(
            label: '+1 ',
            isLocked: true,
            color:Colors.black.withOpacity(0.2),
          ),
      ],
    );
  }
}
 