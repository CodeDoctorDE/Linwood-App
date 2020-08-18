import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// access_token
// token_type
// expires_in
// refresh_token

class CallbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = "";
    if (kIsWeb) {
      args = window.location.href.substring(window.location.href.indexOf(r'?'));
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Test"),
        ),
        body: Container(
          child: Center(child: Text(args)),
        ));
  }
}
