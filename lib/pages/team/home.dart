import 'package:flutter/material.dart';
import 'package:linwood_app/widgets/team/scaffold.dart';

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeamScaffold(pageTitle: "Team", body: Center(child: Text("Welcome")));
  }
}
