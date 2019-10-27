import 'package:dio/dio.dart';
import 'package:flutter_wiki_search_app/model/wiki_image.dart';
import 'package:flutter_wiki_search_app/network/exception/wiki_server_exception.dart';
import 'package:path/path.dart';

import '../dio_http_client.dart';

Future<List<WikiImage>> getPageAllImages(String title) async {
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
  map['aifrom'] = '$text';
  map['format'] = 'json';
  map['list'] = 'allimages';
  map['ailimit'] = '20';

  return map;
}

List<WikiImage> parseResponse(Response<dynamic> queryResponse) {
  final dynamic queryJSON = queryResponse.data['query'];

  List<dynamic> imagesJOSN = queryJSON['allimages'];

  List<WikiImage> images = [];
  for (Map<String, dynamic> imageJSON in imagesJOSN) {
    String fileExtension = extension(imageJSON['url']);

    if (fileExtension == '.jpg' || fileExtension == '.png') {
      images.add(WikiImage.fromJson(imageJSON));
    }
  }
  return images;
}
