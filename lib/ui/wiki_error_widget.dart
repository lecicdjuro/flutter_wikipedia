import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wiki_search_app/model/error_model.dart';
import 'package:flutter_wiki_search_app/resources/dimens.dart' as dimns;

class WikiErrorWidget extends StatelessWidget {
  WikiErrorWidget(this.errorModel);

  final ErrorModel errorModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(dimns.veryLargePadding),
      child: Center(
        child: Text(
          errorModel.description,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.blueAccent, fontSize: dimns.veryLargeText),
        ),
      ),
    );
  }
}
