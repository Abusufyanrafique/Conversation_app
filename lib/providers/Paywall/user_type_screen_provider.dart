import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/models/pay_wall/user_type_model.dart';
import 'package:flutter/material.dart';


class UserTypeScreenProvider extends ChangeNotifier {
  String? _selectedId;

  String? get selectedId => _selectedId;

  bool isSelected(String id) => _selectedId == id;

  void selectAudience(String id) {
    if (_selectedId == id) {
      _selectedId = null;
    } else {
      _selectedId = id;
    }
    notifyListeners();
  }

  bool get hasSelection => _selectedId != null;

  UserTypeModel? getSelectedOption(List<UserTypeModel> options) {
    try {
      return options.firstWhere((o) => o.id == _selectedId);
    } catch (_) {
      return null;
    }
  }

  // Static list of audience options
  static final List<UserTypeModel> audienceOptions = [
     UserTypeModel(
      id: 'partner',
      title: 'My partner',
      subtitle: 'Couples · Intimacy',
      imagePath:AppImages.couples,
      backgroundColor: Color(0xFFCAA19A).withOpacity(0.8)
    ),
     UserTypeModel(
      id: 'friends',
      title: 'Friends',
      subtitle: 'Friendship · Depth',
      imagePath:AppImages.person,
      backgroundColor: Color(0xFFA9B6A2).withOpacity(0.8)
    ),
     UserTypeModel(
      id: 'family',
      title: 'Family',
      subtitle: 'Generations · Care',
      imagePath:AppImages.home,
      backgroundColor: Color(0xFFD8C1A6).withOpacity(0.8)
    ),
     UserTypeModel(
      id: 'self',
      title: 'Self',
      subtitle: 'Reflection · Wonder',
     imagePath:AppImages.self,
      backgroundColor: Color(0xFFB4BAC6),
    ),
     UserTypeModel(
      id: 'team',
      title: 'My team',
      subtitle: 'Work · Leadership',
      imagePath:AppImages.team,
      backgroundColor: Color(0xFFB9A8CA).withOpacity(0.8)
    ),
     UserTypeModel(
      id: 'new_people',
      title: 'New people',
      subtitle: 'Connection · Warmth',
      imagePath:AppImages.emoji,
      backgroundColor: Color(0xFFB29E8C).withOpacity(0.8)
    ),
  ];
}