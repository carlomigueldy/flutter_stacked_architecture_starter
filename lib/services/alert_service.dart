import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/ui/setup_snackbar_ui.dart';
import '../app/locator.dart';

@lazySingleton
class AlertService {
  final _snackbarService = locator<SnackbarService>();

  /// Show a snackbar [Snackbar]
  ///
  /// @param [String] message
  /// @param [IconData] icon
  /// @param [SnackBarType] type
  /// @return void
  void showSnackbar({
    SnackBarType type,
    @required String message,
    dynamic variant,
    String title: 'Alert',
    String mainButtonTitle,
    Function onMainButtonTapped,
    Function onTap,
    Duration duration = const Duration(seconds: 1),
  }) {
    _snackbarService.showCustomSnackBar(
      title: title,
      message: message,
      variant: type,
      mainButtonTitle: mainButtonTitle,
      onMainButtonTapped: onMainButtonTapped,
      onTap: onTap,
      duration: duration,
    );
  }

  /// Get the corresponding icon and icon color
  /// based on provided [SnackBarType] type given.
  ///
  /// @param [SnackBarType] type
  /// @return [Icon]
  getIconByType(SnackBarType type) {
    switch (type) {
      case SnackBarType.SUCCESS:
        return Icon(
          Icons.check_circle_outline,
          color: Colors.green,
        );
      case SnackBarType.ERROR:
        return Icon(
          Icons.error_outline,
          color: Colors.red,
        );
      case SnackBarType.INFO:
        return Icon(
          Icons.info_outline,
          color: Colors.blue,
        );
      default:
        return Icon(
          Icons.info_outline,
          color: Colors.blue,
        );
    }
  }
}
