import 'package:conversation_app/Utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:conversation_app/models/deck_model.dart';

class DeckProvider with ChangeNotifier {
  String? _selectedId;

  String? get selectedId => _selectedId;

  bool get hasSelection => _selectedId != null;

  bool isSelected(String id) => _selectedId == id;

  void selectDeck(String id) {
    _selectedId = _selectedId == id ? null : id;
    notifyListeners();
  }

  final List<DeckModel> decks = const [
    DeckModel(
      id: 'couples',
      title: 'Couples',
      subtitle: 'For partners, near or far',
      icon: Icons.bookmark_border, 
      imagePath: AppImages.couples, 
      imageHeight:27 , 
      imageWidth:22, leftPadding: 12, 
      toppadding:11 ,
    ),
    DeckModel(
      id: 'friends',
      title: 'Friends',
      subtitle: 'Beyond Small Talks',
      icon: Icons.people_outline, 
      imagePath: AppImages.person,
       imageHeight:15 , imageWidth:18, leftPadding: 18, 
       toppadding: 17 ,
    ),
    DeckModel(
      id: 'family',
      title: 'Family',
      subtitle: 'Bridge The Quiet Distance',
      icon: Icons.home_outlined, 
      imagePath:AppImages.family, 
      imageHeight:18 , 
      imageWidth: 22, leftPadding: 18, 
      toppadding: 16,
    ),
    DeckModel(
      id: 'self',
      title: 'Self',
      subtitle: 'Questions for Self',
      icon: Icons.person_outline, 
      imagePath:AppImages.self, 
      imageHeight:19 , 
      imageWidth:18, 
      leftPadding: 18, 
      toppadding: 13 ,
    ),
    DeckModel(
      id: 'work',
      title: 'Work And Career',
      subtitle: 'Meaning, Purpose and Ambition',
      icon: Icons.diamond_outlined, 
      imagePath: AppImages.daimondicon, 
      imageHeight:24 , 
      imageWidth:18.15, leftPadding:26, 
      toppadding: 13 ,
    ),
  ];
}
