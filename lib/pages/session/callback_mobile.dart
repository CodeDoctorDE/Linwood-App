import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CallbackPage extends StatefulWidget {
  @override
  _InAppWebViewPageState createState() => _InAppWebViewPageState();
}

class _InAppWebViewPageState extends State<CallbackPage> {
  InAppWebViewController webView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login with discord")),
        body: Container(
            child: Column(children: <Widget>[
          Expanded(
            child: Container(
              child: InAppWebView(
                initialUrl: "http://myurl",
                onWebViewCreated: (InAppWebViewController controller) {
                  webView = controller;
                },
                onLoadStart: (InAppWebViewController controller, String url) {},
                onLoadStop: (InAppWebViewController controller, String url) {},
                onReceivedHttpAuthRequest:
                    (InAppWebViewController controller, HttpAuthChallenge challenge) async {
                  return HttpAuthResponse(
                      username: "USERNAME",
                      password: "PASSWORD",
                      action: HttpAuthResponseAction.PROCEED);
                },
              ),
            ),
          ),
        ])));
  }
}
