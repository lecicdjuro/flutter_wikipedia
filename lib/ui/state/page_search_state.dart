import 'package:flutter_wiki_search_app/model/wiki_page.dart';

class PageSearchState {
  final bool isLoading;
  final List<Page> pages;
  final bool hasError;

  const PageSearchState({this.isLoading, this.pages, this.hasError});

  factory PageSearchState.initial() {
    return PageSearchState(
      pages: [],
      isLoading: false,
      hasError: false,
    );
  }

  factory PageSearchState.loading() {
    return PageSearchState(
      pages: [],
      isLoading: true,
      hasError: false,
    );
  }

  factory PageSearchState.success(List<Page> pages) {
    return PageSearchState(
      pages: pages,
      isLoading: false,
      hasError: false,
    );
  }

  factory PageSearchState.error() {
    return PageSearchState(
      pages: [],
      isLoading: false,
      hasError: true,
    );
  }

  @override
  String toString() =>
      'Pages {wiki: ${pages.toString()}, isLoading: $isLoading, hasError: $hasError }';
}
