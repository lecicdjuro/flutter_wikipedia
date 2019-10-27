import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wiki_search_app/model/wiki_page.dart';
import 'package:flutter_wiki_search_app/ui/search_delegate.dart';

import '../search_bloc.dart';

const String wikipediaLogoPlaceHolder =
    'https://upload.wikimedia.org/wikipedia/commons/5/53/Wikipedia-logo-en-big.png';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final Bloc searchBloc = SearchBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            closeApp();
          },
        ),
        title: Text('Search Wikipedia'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              await showSearch<Page>(
                context: context,
                delegate: PageSearchDelegate(searchBloc),
              );
            },
          )
        ],
      ),
      body: Center(
        child: CachedNetworkImage(imageUrl: wikipediaLogoPlaceHolder),
      ),
    );
  }

  void closeApp() {
    exit(0);
  }
}
