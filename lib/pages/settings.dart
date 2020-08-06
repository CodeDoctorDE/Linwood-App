import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Settings")),
        body: Builder(builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView(
              children: [
                Card(
                  child: Column(
                    children: [
                      ListTile(
                          title: Text("Theme"),
                          trailing: Icon(MdiIcons.chevronRight),
                          onTap: () async {
                            await showSlidingBottomSheet(
                              context,
                              builder: (context) {
                                return SlidingSheetDialog(
                                    elevation: 8,
                                    cornerRadius: 16,
                                    snapSpec: const SnapSpec(
                                      snap: true,
                                      snappings: [0.4, 0.7, 1.0],
                                      positioning: SnapPositioning
                                          .relativeToAvailableSpace,
                                    ),
                                    builder: (context, state) {
                                      return Material(
                                          child: Container(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              child: Column(children: [
                                                ListTile(
                                                  title: Text("System"),
                                                  leading: Icon(MdiIcons.cogs),
                                                  onTap: () {},
                                                ),
                                                ListTile(
                                                  title: Text("Light"),
                                                  leading: Icon(
                                                      MdiIcons.weatherSunny),
                                                  onTap: () {},
                                                ),
                                                ListTile(
                                                  title: Text("Dark"),
                                                  leading: Icon(
                                                      MdiIcons.weatherNight),
                                                  onTap: () {},
                                                )
                                              ])));
                                    });
                              },
                            );
                          })
                    ],
                  ),
                )
              ],
            ),
          );
        }));
  }
}
