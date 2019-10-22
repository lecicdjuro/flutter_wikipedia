import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WikiWebViewScreen extends StatelessWidget {
  const WikiWebViewScreen(this.title, this.url);

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: WebView(
          initialUrl: url,
        ));
  }
}
