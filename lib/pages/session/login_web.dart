import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import "dart:html" show window;

import 'package:get_it/get_it.dart';
import 'package:linwood_app/services/api_service.dart';
import 'package:linwood_app/services/config_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> _fetchInfo(BuildContext context) async {
    var data = await GetIt.I.get<ApiService>().fetchInfo();
    var error = false;
    try {
      error = data['name'] == "Linwood" && data['api-version'].contains(0);
    } catch (e) {
      error = true;
    }
    if (error)
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Error while connecting to the api"),
                content: Text("Please check your internet connection or try it again later!"),
              ));
    else
      window.location.replace(GetIt.I.get<ConfigService>().loginLink.toString());
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _fetchInfo(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Login")), body: LinearProgressIndicator());
  }
}
