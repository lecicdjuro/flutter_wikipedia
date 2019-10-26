import 'package:dio/dio.dart';
import 'package:flutter_wiki_search_app/model/wiki_page.dart';
import 'package:flutter_wiki_search_app/network/exception/wiki_server_exception.dart';

import '../dio_http_client.dart';

Future<List<Page>> openSearch(String text) async {
  List<Page> pages = [];
  await WikipediaDioClient.getInstance()
      .dio
      .get('https://en.wikipedia.org/w/api.php',
          queryParameters: getParams((text)))
      .then((Response<dynamic> response) {
    try {
      pages = parseResponse(response);
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
  return Future<List<Page>>(() => pages);
}

Map<String, dynamic> getParams(String text) {
  Map<String, dynamic> map = <String, dynamic>{};
  map['action'] = 'opensearch';
  map['namespace'] = '0';
  map['search'] = '$text';
  map['format'] = 'json';
  map['limit'] = '10';
  return map;
}

List<Page> parseResponse(Response<dynamic> queryResponse) {
  List<dynamic> titles = queryResponse.data[1];
  List<dynamic> descripitons = queryResponse.data[2];
  List<dynamic> links = queryResponse.data[3];
  List<Page> pages = [];
  for (int i = 0; i < titles.length; i++) {
    pages.add(Page(
        title: titles.elementAt(i),
        description: descripitons.elementAt(i),
        pageUrl: links.elementAt(i)));
  }
  return pages;
}
