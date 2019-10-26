import 'package:flutter/material.dart';
import 'package:flutter_wiki_search_app/network/dio_http_client.dart';
import 'package:flutter_wiki_search_app/ui/search_page.dart';

void main() {
  WikipediaDioClient();
  runApp(WikipediaApp());
}

class WikipediaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Search Wikipedia',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          accentColor: Colors.blue.shade400,
        ),
        home: SearchPage());
  }
}
