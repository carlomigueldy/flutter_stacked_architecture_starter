import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../services/alert_service.dart';
import '../routes.gr.dart';
import '../locator.dart';

@lazySingleton
class ExceptionHandler {
  AlertService _alertService = locator<AlertService>();
  NavigationService _navigationService = locator<NavigationService>();

  /// A callback function receiving [DioError] as first parameter
  /// then handles the error based on status code given from response.
  ///
  /// @return void
  void handleError(DioError error) {
    print(
        '[Auth Service Error] ${error?.response?.statusCode} ${error?.response?.statusMessage}: ${error?.response}');

    if (error?.response == null) {
      print('[Auth Service Error] no response found: ${error.message}');
    }

    switch (error?.response?.statusCode) {
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
        break;

      case 422:
        _alertService.showSnackbar(
          message: "The data you have provided is invalid.",
          type: SnackBarType.ERROR,
        );
        break;

      case 401:
        _alertService.showSnackbar(
          message: "You are not authenticated.",
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
          message: "An unexpected error has occurred.",
          type: SnackBarType.ERROR,
        );
    }
  }
}
