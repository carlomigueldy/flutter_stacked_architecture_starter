import 'package:flutter_instagram_ui_clone/faker/users.dart';
import 'package:injectable/injectable.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

import '../../models/user.dart' show User;

@lazySingleton
class UserService with ReactiveServiceMixin {
  RxValue<User> _user = RxValue<User>(initial: null);
  RxValue<List<User>> _users = RxValue<List<User>>(initial: []);

  User get user => _user.value;
  List<User> get users => _users.value;

  UserService() {
    listenToReactiveValues([_user, _users]);

    _users.value = generateFakeUsers(quantity: 5);
  }

  Future<List<User>> all() async {
    return _users.value;
  }

  Future<User> findById({int userId}) async {
    return _users.value.firstWhere((element) => element.userId == userId);
  }
}
