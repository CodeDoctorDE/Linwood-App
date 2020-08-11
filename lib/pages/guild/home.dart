import 'package:flutter/material.dart';
import 'package:linwood/widgets/guild/scaffold.dart';

class GuildPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GuildScaffold(
        body: Container(child: Center(child: Text("Coming soon"))),
        pageTitle: "Home");
  }
}
