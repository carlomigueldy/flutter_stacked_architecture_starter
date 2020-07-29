import 'package:stacked/stacked.dart';

enum MenuType {
  LOGIN,
  REGISTER,
}

class MainViewModel extends BaseViewModel {
  MenuType _menuType;
  MenuType get menuType => _menuType;

  selectMenu({MenuType menuType}) {
    _menuType = menuType;
    notifyListeners();
  }
}
