import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/locator.dart';
import '../../../../services/api/authentication_service.dart';

class LoginViewModel extends BaseViewModel {
  final _authController = locator<AuthenticationService>();

  Future<void> login(
      {@required String email, @required String password}) async {
    await _authController.loginWithEmail(email: email, password: password);
  }
}
