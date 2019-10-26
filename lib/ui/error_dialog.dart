import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wiki_search_app/model/error_model.dart';
import 'package:flutter_wiki_search_app/resources/dimens.dart' as dimens;

class ErrorDialog extends StatefulWidget {
  const ErrorDialog(this.error, this.buttonText);

  final ErrorModel error;
  final String buttonText;

  @override
  _ErrorDialogState createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<ErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(dimens.dialogRadius),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Text(
        widget.error.title,
      ),
      content: Text(
        widget.error.description,
      ),
      actions: <Widget>[
        FlatButton(
            textColor: Colors.blue,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              widget.buttonText.toUpperCase(),
            ))
      ],
    );
  }
}
