import 'package:flutter/material.dart';
import 'package:linwood/pages.dart';
import 'package:linwood/services/guild.dart';
import 'package:linwood/widgets/home/scaffold.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GuildsPage extends StatelessWidget {
  final List<Guild> guilds = [
    Guild(
        id: "735424757142519848",
        name: "Linwood",
        added: false,
        icon:
            "https://cdn.discordapp.com/icons/735424757142519848/df07e8d896578e4e73cfc5e111ea59c7.png"),
    Guild(
        id: "735424757142519848",
        name: "another server...",
        added: true,
        icon:
            "https://cdn.discordapp.com/icons/735424757142519848/df07e8d896578e4e73cfc5e111ea59c7.png")
  ];
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: SingleChildScrollView(
              child: Wrap(
                children: List.generate(guilds.length, (index) {
                  var guild = guilds[index];
                  return Card(
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 25),
                          child: Column(
                            children: [
                              if (guild.icon != null)
                                Image.network(
                                  guild.icon,
                                  fit: BoxFit.cover,
                                  height: 120,
                                ),
                              SizedBox(height: 10),
                              Text(guild.name),
                              (guild.added)
                                  ? RaisedButton.icon(
                                      onPressed: () => Navigator.of(context)
                                          .pushNamed(RoutePages.guild),
                                      icon: Icon(MdiIcons.viewDashboardOutline),
                                      label: Text("Manage"))
                                  : RaisedButton.icon(
                                      onPressed: () {},
                                      icon: Icon(MdiIcons.send),
                                      label: Text("Add bot"))
                            ],
                          )));
                }),
              ),
            )),
        pageTitle: "Guilds");
  }
}
