import 'package:flutter/material.dart';
import 'package:flutter_wiki_search_app/model/wiki_page.dart';
import 'package:flutter_wiki_search_app/resources/dimens.dart' as dimens;
import 'package:flutter_wiki_search_app/ui/wiki_image_item.dart';
import 'package:flutter_wiki_search_app/ui/wiki_web_view_screen.dart';

const String noImagePlaceholder =
    'http://www.ristorantelacruda.com/wp-content/themes/paraxe/assets/images/placeholder2.jpg';

class PageItemWidget extends StatelessWidget {
  PageItemWidget(this.page);

  final Page page;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
            onTap: () {
              Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) =>
                          WikiWebViewScreen(page.title, page.getPageUrl())));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  getText(page),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(page.getPageUrl(), style: TextStyle(color: Colors.grey))
              ],
            )),
        Card(
            child: SizedBox(
          height: dimens.pageHeight,
          child: page.images.isNotEmpty
              ? ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: page.images?.length,
                  itemBuilder: (BuildContext context, int index) =>
                      WikiImageItem(page.images.elementAt(index).url),
                )
              : WikiImageItem(noImagePlaceholder),
        )),
        Divider()
      ],
    );
  }

  String getText(Page page) {
    int imageCount = page.images.length;
    String prefix = '${page.title} (${page.images?.length})';
    String suffix = (imageCount == 1) ? 'picture' : 'pictures';
    return prefix + ' ' + suffix;
  }
}
