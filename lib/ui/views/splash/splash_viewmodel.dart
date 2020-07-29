import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../services/api/authentication_service.dart';

class SplashViewModel extends ReactiveViewModel {
  final _authService = locator<AuthenticationService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_authService];

  init() {
    _authService.tryAutoLogin();
  }
}
