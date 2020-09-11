// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/material.dart';

// access_token
// token_type
// expires_in
// refresh_token

class CallbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = window.location.href;
    Uri uri = Uri.parse(args);
    var params = uri.queryParameters.entries.toList();
    return Scaffold(
        appBar: AppBar(
          title: Text("Tefst"),
        ),
        body: Container(
          child: Center(
              child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text(params[index].key),
              subtitle: Text(params[index].value),
            ),
            itemCount: params.length,
          )),
        ));
  }
}
