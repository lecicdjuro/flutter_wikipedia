import 'package:dio/dio.dart';

///class holding an instance of http client that has security
///context in it
class WikipediaDioClient {
  factory WikipediaDioClient() {
    _singleton ??= WikipediaDioClient._internal();

    return _singleton;
  }

  WikipediaDioClient._internal() {
    dio = Dio();
  }

  static WikipediaDioClient _singleton;

  static WikipediaDioClient getInstance() {
    return _singleton;
  }

  Dio dio;
}
