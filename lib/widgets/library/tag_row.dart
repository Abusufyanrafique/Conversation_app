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
    // Remaining locked tags after showing first 2
    final int lockedCount = tags.length > 2 ? tags.length - 2 : 2;

    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [
        // First tag (always)
        if (tags.isNotEmpty)
          TagChip(
            label: tags[0],
            isLocked: false,
            color: color,
          ),

        // Second tag (if exists)
        if (tags.length > 1)
          TagChip(
            label: tags[1],
            isLocked: false,
            color: color,
          ),

        // Premium vs Free logic
        if (isPremium) ...[
          if (tags.length > 2)
            TagChip(
              label: 'All open',
              isLocked: false,
              isAllOpen: true,
              color: color,
            ),
        ] else ...[
          if (lockedCount > 0)
            TagChip(
              label: '$lockedCount locked',
              isLocked: true,
              color: color,
            ),
        ],

        // Always show +1 at end
        TagChip(
          label: '+1',
          isLocked: false,
          color: color,
        ),
      ],
    );
  }
}