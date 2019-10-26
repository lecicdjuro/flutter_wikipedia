import 'package:flutter/cupertino.dart';
import 'package:flutter_wiki_search_app/model/error_model.dart';

import 'base_exception.dart';

///base exception class in comment wall
class WikiServerException extends BaseException {
  WikiServerException({this.code = generic_error, this.info}) : super(code);
  String code;
  String info;

  @override
  ErrorModel getError(BuildContext context) {
    return ErrorModel(code, info);
  }
}
