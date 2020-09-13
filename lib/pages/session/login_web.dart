import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import "dart:html" show window;

import 'package:get_it/get_it.dart';
import 'package:linwood_app/services/config_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    window.location.replace(GetIt.I.get<ConfigService>().loginLink.toString());
    return Container();
  }
}
