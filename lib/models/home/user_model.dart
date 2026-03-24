class UserModel {
  final String greeting;
  final String firstName;
  final String lastName;
  final String date;
  final bool isPremium;
  final String avatarInitial;

  const UserModel({
    required this.greeting,
    required this.firstName,
    required this.lastName,
    required this.date,
    required this.isPremium,
    required this.avatarInitial,
  });
}

class TodayCardModel {
  final String tag;
  final String quote;
  bool isSaved;

  TodayCardModel({
    required this.tag,
    required this.quote,
    this.isSaved = false,
  });
}

class StatModel {
  final String value;
  final String label;
  final String sublabel;

  const StatModel({
    required this.value,
    required this.label,
    required this.sublabel,
  });
}

class DeckModel {
  final String id;
  final String title;
  final String cardCount;
  final String colorHex;
   final String imagePath; 

  const DeckModel({
    required this.id,
    required this.title,
    required this.cardCount,
    required this.colorHex, 
    required this.imagePath,
  });
}

class SavedMomentModel {
  final String quote;

  const SavedMomentModel({required this.quote});
}