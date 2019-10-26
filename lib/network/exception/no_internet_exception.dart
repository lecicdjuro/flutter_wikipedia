import 'package:flutter/material.dart';
import 'package:flutter_wiki_search_app/model/error_model.dart';

import 'base_exception.dart';


class NoInternetException extends BaseException {
  NoInternetException() : super(no_internet_error);

  @override
  ErrorModel getError(BuildContext context) {
    return ErrorModel(
        'No internet', 'Please check your internet connection and try again.');
  }
}
