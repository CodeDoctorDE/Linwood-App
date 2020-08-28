import 'package:flutter/material.dart';

// access_token
// token_type
// expires_in
// refresh_token

class CallbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = "";
    return Scaffold(
        appBar: AppBar(
          title: Text("Test"),
        ),
        body: Container(
          child: Center(child: Text(args)),
        ));
  }
}
