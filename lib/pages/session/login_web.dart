import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import "dart:html" show window;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    window.location.replace("https://google.com");
    return Container();
  }
}
