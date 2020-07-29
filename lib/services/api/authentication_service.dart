import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:dio/dio.dart';

import '../../app/helpers.dart';
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
      handleError(e);
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
      handleError(e);
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
      handleError(e);
    }
  }

  /// Logs out the user.
  ///
  /// @return void
  Future logout() async {
    try {
      await dio.get(
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
      handleError(e);
    }
  }

  /// Use the authorization header with Bearer token.
  ///
  /// @return [Options]
  Options authorizationHeader({bool followRedirects = false}) {
    return Options(
      headers: {
        "Authorization": "Bearer ${_token.value}",
        "accept": "application/json",
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

  /// A callback function receiving [DioError] as first parameter
  /// then handles the error based on status code given from response.
  ///
  /// @return void
  void handleError(DioError error) {
    print(
        '[Auth Service Error] ${error.response.statusCode} ${error.response.statusMessage}');

    if (error.response == null) {
      print('[Auth Service Error] no response found');
    }

    switch (error.response.statusCode) {
      case 302:
        _alertService.showSnackbar(
          message: "Some error occurred, sorry but we're trying to fix it!",
          type: SnackBarType.ERROR,
        );
        break;
      case 403:
        _alertService.showSnackbar(
          message:
              "You do not have the right privileges to access this resource.",
          type: SnackBarType.ERROR,
        );
        _navigationService.pushNamedAndRemoveUntil(Routes.mainView);
        break;
      case 422:
        _alertService.showSnackbar(
          message: "The data you have provided is invalid.",
          type: SnackBarType.ERROR,
        );
        break;
      case 401:
        _alertService.showSnackbar(
          message: "Incorrect credentials.",
          type: SnackBarType.ERROR,
        );
        _navigationService.pushNamedAndRemoveUntil(Routes.mainView);
        break;
      case 404:
        _alertService.showSnackbar(
          message: "Request not found.",
          type: SnackBarType.ERROR,
        );
        break;
      case 500:
        _alertService.showSnackbar(
          message:
              "There is something wrong with our servers, please report to the admin so it gets fixed.",
          type: SnackBarType.ERROR,
        );
        break;
      default:
        _alertService.showSnackbar(
          message: "An anonymous error has occurred.",
          type: SnackBarType.ERROR,
        );
    }
  }
}
