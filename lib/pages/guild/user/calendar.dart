import 'package:flutter/material.dart';
import 'package:linwood_app/widgets/guild/scaffold.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../pages.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GuildScaffold(
      pageTitle: "Calendar",
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(title: Text(index.toString())),
        itemCount: 5,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Create",
        child: Icon(MdiIcons.plus),
        onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) => Container(
                margin: EdgeInsets.only(bottom: 20),
                child: ListView(shrinkWrap: true, children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Text(
                      "Create",
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ListTile(
                      title: Text("Event"),
                      leading: Icon(MdiIcons.trophyOutline),
                      onTap: () => Navigator.of(context).pop(ThemeMode.system)),
                  ListTile(
                      title: Text("Birthday"),
                      leading: Icon(MdiIcons.cake),
                      onTap: () => Navigator.of(context).pushNamed(RoutePages.createBirthday)),
                  const SizedBox(height: 32),
                ]))),
      ),
    );
  }
}
