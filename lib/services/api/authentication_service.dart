import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:dio/dio.dart';

import '../../app/exceptions/handler.dart';
import '../../app/utils/device.dart';
import '../../app/http.dart';
import '../../models/user.dart';
import '../../app/routes.gr.dart';
import '../../app/locator.dart';
import '../alert_service.dart';
import 'models/authentication_response.dart';

@lazySingleton
class AuthenticationService with ReactiveServiceMixin {
  /// Here we instantiate all the services and
  /// other classes that this [AuthenticationService] requires.
  final _navigationService = locator<NavigationService>();
  final _alertService = locator<AlertService>();
  final _exceptionHandler = locator<ExceptionHandler>();
  final _deviceInfo = locator<AppDeviceInfo>();

  Future<SharedPreferences> _localStorage = SharedPreferences.getInstance();

  AuthenticationService() {
    listenToReactiveValues([_token]);
  }

  /// @return [String] token
  RxValue<String> _token = RxValue<String>(initial: "");
  String get token => _token.value;
  bool get loggedIn => _token.value.isNotEmpty ? true : false;

  /// @return [User] user
  RxValue<User> _user = RxValue<User>(initial: null);
  User get user => _user.value;

  static const authTokenKey = 'auth.token';

  /// Initialize the authentication service to check if user contains token.
  /// And if user contains token from [SharedPreferences] then we set [_token]
  /// to the token that was stored locally.
  ///
  /// @return void
  void tryAutoLogin() async {
    final SharedPreferences localStorage = await _localStorage;

    if (localStorage.containsKey(authTokenKey)) {
      String token = localStorage.getString(authTokenKey);
      _token.value = token;

      await fetchUser();
      token.isNotEmpty
          ? _navigationService.pushNamedAndRemoveUntil(Routes.homeView)
          : _navigationService.pushNamedAndRemoveUntil(Routes.mainView);
    } else {
      _navigationService.pushNamedAndRemoveUntil(Routes.mainView);
    }

    print('[Authentication Service] has token? ' + loggedIn.toString());
  }

  /// Login with email and password.
  ///
  /// @param [EmailCredential] credentials A map containing email and password
  /// @return void
  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      Response response = await dio.post(
        '/api/auth/login',
        data: {
          "email": email,
          "password": password,
          "device_name": await _deviceInfo.getDeviceName(),
        },
        options: Options(headers: headers),
      );

      AuthenticationResponse data =
          AuthenticationResponse.fromJson(response.data);
      _token.value = data.accessToken;
      setToken(data.accessToken);
      await fetchUser();
      _alertService.showSnackbar(
        message: "You have logged in.",
        type: SnackBarType.SUCCESS,
      );
      _navigationService.pushNamedAndRemoveUntil(Routes.homeView);

      return response;
    } on DioError catch (e) {
      _exceptionHandler.handleError(e);
    }
  }

  /// Login with email and password.
  ///
  /// @param [UsernameCredential] credentials A map containing email and password
  /// @return void
  Future loginWithUsername({
    @required String username,
    @required String password,
  }) async {
    try {
      Response response = await dio.post(
        '/api/auth/login',
        data: {
          "username": username,
          "password": password,
          "device_name": await _deviceInfo.getDeviceName(),
        },
      );

      AuthenticationResponse data =
          AuthenticationResponse.fromJson(response.data);
      _token.value = data.accessToken;
      setToken(data.accessToken);
      await fetchUser();
      _alertService.showSnackbar(
        message: "You have logged in.",
        type: SnackBarType.SUCCESS,
      );
      _navigationService.pushNamedAndRemoveUntil(Routes.homeView);

      return response;
    } on DioError catch (e) {
      _exceptionHandler.handleError(e);
    }
  }

  /// Fetch the current authenticated user.
  ///
  /// @return void
  Future fetchUser() async {
    try {
      Response response = await dio.get(
        '/api/auth/user',
        options: authorizationHeader(),
      );

      User data = User.fromJson(response.data);
      _user.value = data;
    } on DioError catch (e) {
      _exceptionHandler.handleError(e);
    }
  }

  /// Logs out the user.
  ///
  /// @return void
  Future logout() async {
    try {
      await dio.delete(
        '/api/auth/logout',
        options: authorizationHeader(),
      );

      deleteToken();
      _user.value = User(id: 0);
      _alertService.showSnackbar(
        message: "You have logged out.",
        type: SnackBarType.INFO,
      );
      _navigationService.pushNamedAndRemoveUntil(Routes.mainView);
    } on DioError catch (e) {
      _exceptionHandler.handleError(e);
    }
  }

  /// Use the authorization header with Bearer token.
  ///
  /// @return [Options]
  Options authorizationHeader({bool followRedirects = false}) {
    return Options(
      headers: {
        "Authorization": "Bearer ${_token.value}",
        "Accept": "application/json",
      },
      followRedirects: false,
      // validateStatus: (status) => status < 500,
    );
  }

  /// Sets the authentication token in the state and also locally
  /// using [SharedPreferences]
  ///
  /// @param string [token]
  /// @return void
  void setToken(String token) async {
    final SharedPreferences localStorage = await _localStorage;
    _token.value = token;
    localStorage.setString(authTokenKey, token);
  }

  /// Destroy the auth token from state and in [SharedPreferences]
  ///
  /// @return void
  void deleteToken() async {
    final SharedPreferences localStorage = await _localStorage;
    _token.value = "";
    localStorage.remove(authTokenKey);
  }
}
