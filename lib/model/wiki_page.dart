import 'package:flutter_wiki_search_app/model/wiki_image.dart';

class Page {
  Page({this.id, this.title, this.description, this.pageUrl});

  factory Page.fromJson(Map<String, dynamic> pageJSON) {
    return Page(id: pageJSON['pageid'], title: pageJSON['title']);
  }

  int id;
  String title;
  String description;
  String pageUrl;
  List<WikiImage> images;

  String getPageUrl() {
    return 'https://en.wikipedia.org/wiki/$title';
  }
}
