import 'package:flutter/cupertino.dart';
import 'package:flutter_wiki_search_app/model/error_model.dart';

import 'base_exception.dart';

///base exception class in comment wall
class WikiServerException extends BaseException {
  WikiServerException({this.code = generic_error}) : super(code);
  String code;

  @override
  ErrorModel getError(BuildContext context) {
    String info = '';
    switch (errorCode) {
      case no_search:
        info = 'You must enter something... :-)';
        break;
      case unknown_format:
        info = 'Unrecognized value for parameter format: aaa.';
        break;
      default:
        info = 'Oops! Something went wrong ';
        break;
    }
    return ErrorModel('Error', info);
  }
}
