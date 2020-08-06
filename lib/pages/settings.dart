import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SheetController controller;
  @override
  void initState() {
    controller = SheetController();
    super.initState();
  }

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
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                            title: Text("Theme",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle1),
                            trailing: Icon(MdiIcons.chevronRight,
                                color: Theme.of(context).primaryIconTheme.color,
                                size: Theme.of(context).primaryIconTheme.size),
                            onTap: () async {
                              await showSlidingBottomSheet(
                                context,
                                builder: (context) {
                                  return SlidingSheetDialog(
                                      controller: controller,
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
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5,
                                                    vertical: 10),
                                                child: Text(
                                                  "Theme",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5,
                                                ),
                                              ),
                                              ListTile(
                                                title: Text("System"),
                                                leading: Icon(MdiIcons.cogs),
                                                onTap: () {},
                                              ),
                                              ListTile(
                                                title: Text("Light"),
                                                leading:
                                                    Icon(MdiIcons.weatherSunny),
                                                onTap: () {},
                                              ),
                                              ListTile(
                                                title: Text("Dark"),
                                                leading:
                                                    Icon(MdiIcons.weatherNight),
                                                onTap: () {},
                                              ),
                                              const SizedBox(height: 32),
                                            ])));
                                      });
                                },
                              );
                            })
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
