import 'package:dio/dio.dart';
import 'package:flutter_wiki_search_app/network/exception/wiki_server_exception.dart';

import '../dio_http_client.dart';

Future<String> getImageUrl(String imageName) async {
  String url;
  await WikipediaDioClient.getInstance()
      .dio
      .get('https://en.wikipedia.org/w/api.php',
          queryParameters: getParams((imageName)))
      .then((Response<dynamic> response) {
    try {
      url = parseResponse(response);
    } catch (error) {
      String errorCode;
      if (error is NoSuchMethodError) {
        errorCode = response.data['error']['code'];
        throw WikiServerException(code: errorCode);
      } else {
        throw WikiServerException();
      }
    }
  });
  return Future<String>(() => url);
}

Map<String, dynamic> getParams(String text) {
  Map<String, dynamic> map = <String, dynamic>{};
  map['action'] = 'query';
  map['titles'] = '$text';
  map['prop'] = 'pageimages';
  map['pithumbsize'] = '100';
  map['format'] = 'json';
  return map;
}

String parseResponse(Response<dynamic> response) {
  final Map<String, dynamic> queryResponse = response.data['query'];
  final Map<String, dynamic> pageInfoJSON = queryResponse['pages'];
  final Map<String, dynamic> imagesJSON =
      pageInfoJSON?.values?.toList()?.elementAt(0)['thumbnail'];
  return imagesJSON['source'];
}
