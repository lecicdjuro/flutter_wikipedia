import 'package:flutter/material.dart';

import 'base_exception.dart';

void handleException(BuildContext context, dynamic error, StackTrace stackTrace,
    {bool showErrorDialog = false}) {
  if (error is BaseException) {
    if (showErrorDialog) {
      error.handleErrorWithDialog(context);
    } else {
      error.handleErrorWithSnackBar(context);
    }
  }
}
