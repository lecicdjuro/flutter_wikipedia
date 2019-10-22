import 'package:dio/dio.dart';
import 'package:flutter_wiki_search_app/model/wiki_image.dart';
import 'package:flutter_wiki_search_app/network/exception/wiki_server_exception.dart';

import '../dio_http_client.dart';

Future<List<WikiImage>> getPageImages(String title) async {
  List<WikiImage> images = [];
  await WikipediaDioClient.getInstance()
      .dio
      .get('https://en.wikipedia.org/w/api.php',
          queryParameters: getParams((title)))
      .then((Response<dynamic> response) {
    try {
      images = parseResponse(response);
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
  return Future<List<WikiImage>>(() => images);
}

Map<String, dynamic> getParams(String text) {
  Map<String, dynamic> map = <String, dynamic>{};
  map['action'] = 'query';
  map['titles'] = '$text';
  map['format'] = 'json';
  map['prop'] = 'images';
  map['imlimit'] = '7';
  map['aimime'] = 'jpg';
  return map;
}

List<WikiImage> parseResponse(Response<dynamic> queryResponse) {
  final dynamic queryJSON = queryResponse.data['query'];
  final Map<String, dynamic> pageInfoJSON = queryJSON['pages'];
  List<dynamic> pageInfoJSONLIst = pageInfoJSON.values.toList();
  Map<String, dynamic> imagesJSON = pageInfoJSONLIst?.elementAt(0);

  if (imagesJSON != null) {
    List<dynamic> imagesList = imagesJSON['images'];
    return imagesList.map((dynamic images) {
      return WikiImage.fromJson(images);
    }).toList();
  }
  return [];
}
