import 'package:flutter/material.dart';
import 'package:linwood_app/widgets/guild/scaffold.dart';

class UserSettingsPage extends StatefulWidget {
  @override
  _UserSettingsPageState createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return GuildScaffold(
        pageTitle: "Options", body: Container(child: Center(child: Text("Coming soon..."))));
  }
}
