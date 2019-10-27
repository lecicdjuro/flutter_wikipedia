import 'package:flutter_wiki_search_app/model/wiki_page.dart';
import 'package:flutter_wiki_search_app/network/exception/base_exception.dart';

class PageSearchState {
  final bool isLoading;
  final List<Page> pages;
  final BaseException wikiError;

  const PageSearchState({this.isLoading, this.pages, this.wikiError});

  factory PageSearchState.initial() {
    return PageSearchState(
      pages: [],
      isLoading: false,
    );
  }

  factory PageSearchState.loading() {
    return PageSearchState(
      pages: [],
      isLoading: true,
    );
  }

  factory PageSearchState.success(List<Page> pages) {
    return PageSearchState(
      pages: pages,
      isLoading: false,
    );
  }

  factory PageSearchState.error(BaseException exception) {
    return PageSearchState(
      pages: [],
      isLoading: false,
      wikiError: exception,
    );
  }

  @override
  String toString() =>
      'Pages {wiki: ${pages.toString()}, isLoading: $isLoading, hasError: $wikiError }';
}
