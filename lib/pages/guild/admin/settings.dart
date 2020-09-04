import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:linwood_app/widgets/guild/scaffold.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../pages.dart';

class AdminSettingsPage extends StatefulWidget {
  @override
  _AdminSettingsPageState createState() => _AdminSettingsPageState();
}

class _AdminSettingsPageState extends State<AdminSettingsPage> {
  var languages = ["de", "en"];
  var _selectedLanguage;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: GuildScaffold(
          bottom: TabBar(
              labelPadding: EdgeInsets.symmetric(horizontal: 50.0),
              isScrollable: true,
              tabs: [
                Tab(
                  icon: Icon(MdiIcons.tune),
                  text: "General",
                ),
                Tab(
                  icon: Icon(MdiIcons.gamepad),
                  text: "Games",
                ),
                Tab(
                  icon: Icon(MdiIcons.podium),
                  text: "Karma",
                ),
                Tab(
                  icon: Icon(MdiIcons.bellOutline),
                  text: "Notification",
                ),
                Tab(
                  icon: Icon(MdiIcons.accountMultiplePlusOutline),
                  text: "Invites",
                )
              ]),
          body: TabBarView(
            children: [
              ListView(children: [
                Card(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ListTile(
                        title: Text("Guild default language"),
                        trailing: Container(
                            width: 150,
                            child: DropdownButtonFormField<String>(
                                items: languages.map((String val) {
                                  return new DropdownMenuItem<String>(
                                    value: val,
                                    child: new Text(val),
                                  );
                                }).toList(),
                                value: _selectedLanguage,
                                onChanged: (newVal) {
                                  this.setState(() {
                                    _selectedLanguage = newVal;
                                  });
                                }))),
                    ListTile(
                      title: Text("switch"),
                      trailing: Switch(value: true, onChanged: (bool value) {}),
                    ),
                    ListTile(
                      title: Text("Prefixes"),
                      onTap: () => Navigator.of(context).pushNamed(RoutePages.prefixes),
                    )
                  ]),
                )
              ]),
              ListView(children: [
                Card(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ListTile(
                      title: Text("Game master"),
                      subtitle: RichText(
                          text: TextSpan(
                              text: "Current: ",
                              style: Theme.of(context).textTheme.caption,
                              children: [
                            TextSpan(
                                text: "Game master", style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: " "),
                            TextSpan(
                                text: "(123456789)", style: TextStyle(fontStyle: FontStyle.italic))
                          ]))),
                  ListTile(
                      title: Text("Game category"),
                      subtitle: RichText(
                          text: TextSpan(
                              text: "Current: ",
                              style: Theme.of(context).textTheme.caption,
                              children: [
                            TextSpan(text: "Games", style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: " "),
                            TextSpan(
                                text: "(123456789)", style: TextStyle(fontStyle: FontStyle.italic))
                          ])))
                ]))
              ]),
              ListView(children: [
                Card(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ListTile(
                      title: Text("Karma levelup channel"),
                      subtitle: RichText(
                          text: TextSpan(
                              text: "Current: ",
                              style: Theme.of(context).textTheme.caption,
                              children: [
                            TextSpan(
                                text: "Game master", style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: " "),
                            TextSpan(
                                text: "(123456789)", style: TextStyle(fontStyle: FontStyle.italic))
                          ]))),
                  ListTile(
                    title: Text("Prefixes"),
                    onTap: () => Navigator.of(context).pushNamed(RoutePages.prefixes),
                  )
                ]))
              ]),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ],
          ),
          pageTitle: "Admin Settings",
        ));
  }
}
