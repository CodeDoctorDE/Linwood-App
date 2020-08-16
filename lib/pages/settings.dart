import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
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
                        child: Column(children: [
                          ListTile(
                              title: Text("Theme",
                                  style: Theme.of(context).primaryTextTheme.subtitle1),
                              trailing: Icon(MdiIcons.chevronRight,
                                  color: Theme.of(context).primaryIconTheme.color,
                                  size: Theme.of(context).primaryIconTheme.size),
                              onTap: () => _openThemeModal())
                        ]))),
                Card(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          ListTile(
                            title: Text("Impress",
                                style: Theme.of(context).primaryTextTheme.subtitle1),
                            trailing: Icon(MdiIcons.openInNew,
                                color: Theme.of(context).primaryIconTheme.color,
                                size: Theme.of(context).primaryIconTheme.size),
                            onTap: () =>
                                launch("https://codedoctor.tk/impress", forceWebView: true),
                          ),
                          ListTile(
                            title: Text("Privacy",
                                style: Theme.of(context).primaryTextTheme.subtitle1),
                            trailing: Icon(MdiIcons.openInNew,
                                color: Theme.of(context).primaryIconTheme.color,
                                size: Theme.of(context).primaryIconTheme.size),
                            onTap: () =>
                                launch("https://codedoctor.tk/privacy", forceWebView: true),
                          ),
                          ListTile(
                              title: Text("Information",
                                  style: Theme.of(context).primaryTextTheme.subtitle1),
                              trailing: Icon(MdiIcons.informationOutline,
                                  color: Theme.of(context).primaryIconTheme.color,
                                  size: Theme.of(context).primaryIconTheme.size),
                              onTap: () {
                                showAboutDialog(
                                    context: context,
                                    applicationIcon: Image.asset(
                                      "assets/icon.png",
                                      height: 50,
                                    ));
                              })
                        ])))
              ],
            ),
          );
        }));
  }

  void _openThemeModal() async {
    var _currentTheme = ThemeController.of(context).currentThemeMode;
    var themeMode = await showModalBottomSheet<ThemeMode>(
        context: context,
        builder: (context) {
          return Container(
              margin: EdgeInsets.only(bottom: 20),
              child: ListView(shrinkWrap: true, children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text(
                    "Theme",
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
                ListTile(
                    title: Text("System"),
                    selected: _currentTheme == ThemeMode.system,
                    leading: Icon(MdiIcons.cogs),
                    onTap: () => Navigator.of(context).pop(ThemeMode.system)),
                ListTile(
                    title: Text("Light"),
                    selected: _currentTheme == ThemeMode.light,
                    leading: Icon(MdiIcons.weatherSunny),
                    onTap: () => Navigator.of(context).pop(ThemeMode.light)),
                ListTile(
                    title: Text("Dark"),
                    selected: _currentTheme == ThemeMode.dark,
                    leading: Icon(MdiIcons.weatherNight),
                    onTap: () => Navigator.of(context).pop(ThemeMode.dark)),
                const SizedBox(height: 32),
              ]));
        });
    if (themeMode == null) return;
    ThemeController.of(context).setThemeMode(themeMode);
  }
}
