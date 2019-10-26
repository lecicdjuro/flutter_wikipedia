import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wiki_search_app/event/search_event.dart';
import 'package:flutter_wiki_search_app/model/wiki_page.dart';
import 'package:flutter_wiki_search_app/resources/dimens.dart' as dimens;
import 'package:flutter_wiki_search_app/ui/page_item_widget.dart';
import 'package:flutter_wiki_search_app/ui/state/page_search_state.dart';
import 'package:flutter_wiki_search_app/ui/wiki_error_widget.dart';

class PageSearchDelegate extends SearchDelegate<Page> {
  final Bloc<PageSearchEvent, PageSearchState> searchBloc;

  PageSearchDelegate(this.searchBloc);

  @override
  List<Widget> buildActions(BuildContext context) => null;

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: BackButtonIcon(),
      color: Colors.blueAccent,
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchBloc.dispatch(PageSearchEvent(query));
    return BlocBuilder(
      bloc: searchBloc,
      builder: (BuildContext context, PageSearchState state) {
        if (state.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.hasError) {
          return WikiErrorWidget();
        }

        return state.pages.length > 0
            ? ListView.builder(
                itemBuilder: (context, index) {
                  Page page = state.pages.elementAt(index);
                  return PageItemWidget(page);
                },
                itemCount: state.pages.length,
              )
            : Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.not_interested,
                    size: dimens.veryLargeIcon,
                    color: Colors.blueAccent,
                  ),
                  Text(
                    'No search results',
                    style: TextStyle(
                        fontSize: dimens.veryLargeText,
                        color: Colors.blueAccent),
                  )
                ],
              ));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) => Container();
}
