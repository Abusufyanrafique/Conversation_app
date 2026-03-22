 // ─────────────────────────────────────────────
// MODEL
// ─────────────────────────────────────────────
 
class SavedConversation {
  final String id;
  final String title;
  final String subtitle;
  final DateTime savedAt;
 
  const SavedConversation({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.savedAt,
  });
}