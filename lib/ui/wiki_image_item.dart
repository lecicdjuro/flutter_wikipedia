import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WikiImageItem extends StatefulWidget {
  WikiImageItem(this._imageURL);

  final String _imageURL;

  @override
  _WikiImageItemState createState() => _WikiImageItemState();
}

class _WikiImageItemState extends State<WikiImageItem> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: widget._imageURL,
        errorWidget: (context, url, error) => Icon(Icons.error));
  }
}
