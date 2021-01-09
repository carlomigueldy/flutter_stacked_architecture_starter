import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ExceptionHandler {
  /// A callback function receiving [DioError] as first parameter
  /// then handles the error based on status code given from response.
  ///
  /// @return [String]
  String getErrorMessage(DioError error) {
    print(
        '[Auth Service Error] ${error?.response?.statusCode} ${error?.response?.statusMessage}: ${error?.response}');

    if (error?.response == null) {
      print('[Auth Service Error] no response found: ${error.message}');
    }

    switch (error?.response?.statusCode) {
      case 302:
        return "Some error occurred, sorry but we're trying to fix it!";

      case 403:
        return "You do not have the right privileges to access this resource.";

      case 422:
        return "The data you have provided is invalid.";

      case 401:
        return "You are not authenticated.";

      case 404:
        return "Request not found.";

      case 500:
        return "There is something wrong with our servers, please report to the admin so it gets fixed.";

      default:
        return "An unexpected error has occurred.";
    }
  }
}
