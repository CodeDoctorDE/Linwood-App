import 'package:flutter/material.dart';
import 'package:linwood/widgets/guild/scaffold.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AdminSettingsPage extends StatefulWidget {
  @override
  _AdminSettingsPageState createState() => _AdminSettingsPageState();
}

class _AdminSettingsPageState extends State<AdminSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
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
                  icon: Icon(MdiIcons.podium),
                  text: "Karma",
                ),
                Tab(
                  icon: Icon(MdiIcons.bellOutline),
                  text: "Notification",
                ),
                Tab(
                  icon: Icon(MdiIcons.gamepad),
                  text: "Games",
                )
              ]),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ],
          ),
          pageTitle: "Admin Settings",
        ));
  }
}
