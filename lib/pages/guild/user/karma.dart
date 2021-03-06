import 'package:flutter/material.dart';
import 'package:linwood_app/models/user.dart';
import 'package:linwood_app/widgets/guild/scaffold.dart';

class KarmaPage extends StatefulWidget {
  @override
  _KarmaPageState createState() => _KarmaPageState();
}

class _KarmaPageState extends State<KarmaPage> {
  List<User> leaderboard = [User(), User()];
  @override
  Widget build(BuildContext context) {
    return GuildScaffold(
      pageTitle: "Karma",
      body: Container(
        child: ListView.builder(itemBuilder: null),
      ),
    );
  }
}
