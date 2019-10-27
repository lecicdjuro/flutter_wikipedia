import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_wiki_search_app/network/exception/no_internet_exception.dart';
import 'package:flutter_wiki_search_app/ui/state/page_search_state.dart';

import 'event/search_event.dart';
import 'model/wiki_page.dart';
import 'network/exception/wiki_server_exception.dart';
import 'network/requests/get_all_images.dart';
import 'network/requests/open_search.dart';

class SearchBloc extends Bloc<PageSearchEvent, PageSearchState> {
  @override
  PageSearchState get initialState => PageSearchState.initial();

  @override
  void onTransition(Transition<PageSearchEvent, PageSearchState> transition) {
    print(transition.toString());
  }

  @override
  Stream<PageSearchState> mapEventToState(PageSearchEvent event) async* {
    yield PageSearchState.loading();
    try {
      List<Page> pages = await _getSearchResults(event.query);
      yield PageSearchState.success(pages);
    } catch (error) {
      yield PageSearchState.error(error);
    }
  }

  Future<List<Page>> _getSearchResults(String query) async {
    List<Page> pages = [];
    try {
      pages = await openSearch(query);
      for (Page page in pages) {
        page.images = await getPageAllImages(page.title);
      }
    } catch (error) {
      if (error is DioError) {
        if (error.error is SocketException) {
          throw NoInternetException();
        } else {
          throw WikiServerException();
        }
      } else if (error is WikiServerException) {
        rethrow;
      } else {
        throw WikiServerException();
      }
    }
    return pages;
  }
}
