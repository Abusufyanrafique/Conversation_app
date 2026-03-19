class ConversationCard {
  final int id;
  final String? question;
  final String imagePath;

  //  UI properties add karo
  final double height;
  final double width;
  final double? angle; // rotation (radians me)
  final double? top;
  final double? left;

  const ConversationCard({
    required this.id,
    this.question,
    required this.imagePath,
    required this.height,
    required this.width,
     this.angle,
     this.top,
     this.left,
  });
}