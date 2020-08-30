import 'package:flutter/material.dart';
import 'package:linwood_app/models/team.dart';
import 'package:linwood_app/widgets/guild/scaffold.dart';

class TeamsPage extends StatelessWidget {
  final List<Team> teams = [
    Team(id: "0908", name: "Test Team", plan: TeamPlan.private, role: Role.member)
  ];
  @override
  Widget build(BuildContext context) {
    return GuildScaffold(
      pageTitle: "Teams",
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: Text(""),
          ),
        ),
      ),
    );
  }
}
