import 'package:flutter/material.dart';
import 'package:linwood_app/widgets/guild/scaffold.dart';

class GuildArguments {
  final String guildId;

  GuildArguments(this.guildId);
}

class GuildPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GuildArguments args = ModalRoute.of(context).settings.arguments;
    return GuildScaffold(
        body: Container(child: Center(child: Text("Coming soon! Guild: ${args.guildId}"))),
        pageTitle: "Home");
  }
}
