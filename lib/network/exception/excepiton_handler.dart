import 'package:flutter/material.dart';

import 'base_exception.dart';

void handleException(BuildContext context,GlobalKey<ScaffoldState> scaffoldKey, dynamic error,
    {bool showErrorDialog = false}) {
  if (error is BaseException) {
    if (showErrorDialog) {
      error.handleErrorWithDialog(context, scaffoldKey);
    } else {
      error.handleErrorWithSnackBar(context, scaffoldKey);
    }
  }
}
