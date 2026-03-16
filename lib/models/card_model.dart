class CardModel {
  final String frontText;
  final String backText;

  const CardModel({
    required this.frontText,
    required this.backText,
  });
}

final List<CardModel> cardData = [
  CardModel(
    frontText: '"What would you want me to truly understand about the way you love?"',
    backText: '"What makes you feel safe enough to open your heart completely?"',
  ),
  CardModel(
    frontText: '"When do you feel most loved without any words at all?"',
    backText: '"Which small moment made you feel truly seen today?"',
  ),
  CardModel(
    frontText: '"What do you wish people understood about your silence?"',
    backText: '"Where do you carry the feelings you never say out loud?"',
  ),
  CardModel(
    frontText: '"What does love look like when no one is watching?"',
    backText: '"How do you know when someone truly understands you?"',
  ),
  CardModel(
    frontText: '"What part of yourself are you still learning to love?"',
    backText: '"What would you tell your heart if it could listen?"',
  ),
];