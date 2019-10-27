import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wiki_search_app/model/error_model.dart';
import 'package:flutter_wiki_search_app/ui/error_dialog.dart';
import 'package:flutter_wiki_search_app/resources/colors.dart' as colors;

const String generic_error = 'generic_error';
const String no_internet_error = 'no_internet_error';
const int snack_bar_duration = 4;
const String no_search = 'nosearch';
const String unknown_format = 'unknown_format';

///base exception class in comment wall
abstract class BaseException implements Exception {
  BaseException(this.errorCode);

  String errorCode;

  ErrorModel getError(BuildContext context);

  void handleErrorWithDialog(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    final ErrorModel error = getError(context);
    _showErrorDialog(context, error);
  }

  void handleErrorWithSnackBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    final ErrorModel error = getError(context);
    _showSnackBar(context, error);
  }

  void _showErrorDialog(BuildContext context, ErrorModel error) {
    showDialog<dynamic>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ErrorDialog(error, 'Ok');
        },
    );
  }

  void _showSnackBar(BuildContext context, ErrorModel error) {
    Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: colors.snackBarBackground,
        content: Text(error.description),
        duration: Duration(seconds: snack_bar_duration),
        action: SnackBarAction(
          label: 'Ok',
          textColor: colors.primaryColor,
          onPressed: () {},
        )));
  }
}
