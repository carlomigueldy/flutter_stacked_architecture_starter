import 'package:stacked/stacked.dart';

import '../../../models/user.dart' show User;
import '../../../app/locator.dart' show locator;
import '../../../services/api/authentication_service.dart'
    show AuthenticationService;

class HomeViewModel extends ReactiveViewModel {
  final AuthenticationService _authService = locator<AuthenticationService>();

  User get user => _authService.user;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_authService];

  Future<void> logout() async {
    await _authService.logout();
  }
}
