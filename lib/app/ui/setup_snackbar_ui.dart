import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../locator.dart';

enum SnackBarType {
  BASIC,
  SUCCESS,
  ERROR,
  INFO,
}

void setupSnackbarUi() {
  final SnackbarService snackbarService = locator<SnackbarService>();

  EdgeInsetsGeometry margin = const EdgeInsets.all(5);

  snackbarService.registerSnackbarConfig(
    SnackbarConfig(
      backgroundColor: Colors.black,
      textColor: Colors.white,
      margin: margin,
    ),
  );

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackBarType.BASIC,
    config: SnackbarConfig(
      backgroundColor: Colors.black,
      textColor: Colors.white,
      margin: margin,
    ),
  );

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackBarType.SUCCESS,
    config: SnackbarConfig(
      backgroundColor: Colors.green,
      textColor: Colors.white,
      margin: margin,
    ),
  );

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackBarType.INFO,
    config: SnackbarConfig(
      backgroundColor: Colors.blueAccent,
      textColor: Colors.white,
      margin: margin,
    ),
  );

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackBarType.ERROR,
    config: SnackbarConfig(
      backgroundColor: Colors.red,
      textColor: Colors.white,
      margin: margin,
    ),
  );
}
