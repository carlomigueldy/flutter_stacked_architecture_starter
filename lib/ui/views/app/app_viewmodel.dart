import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../models/user.dart';
import '../../../services/api/user_service.dart';

enum MenuType {
  LOGIN,
  REGISTER,
}

class AppViewModel extends BaseViewModel {
  final UserService _userService = locator<UserService>();

  MenuType _menuType;
  MenuType get menuType => _menuType;

  List<User> get users => _userService.users;

  selectMenu({MenuType menuType}) {
    _menuType = menuType;
    notifyListeners();
  }
}
