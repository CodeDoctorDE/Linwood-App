import 'package:flutter/material.dart';
import 'package:linwood/pages/settings.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Choice {
  const Choice({this.title, this.icon, this.onClick});

  final String title;
  final IconData icon;
  final void Function(BuildContext context) onClick;
}

class LinwoodPopupMenu extends StatelessWidget {
  final List<Choice> choices = <Choice>[
    Choice(
        title: 'Settings',
        icon: MdiIcons.cogs,
        onClick: (context) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SettingsPage()));
        }),
    Choice(
        title: 'Logout',
        icon: MdiIcons.logout,
        onClick: (context) {
          print("test");
        }),
  ];
  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.subtitle1;
    var iconStyle = Theme.of(context).iconTheme;
    return PopupMenuButton<Choice>(
      onSelected: (Choice choice) {
        choice.onClick(context);
      },
      itemBuilder: (BuildContext context) {
        return choices.map((var choice) {
          return PopupMenuItem<Choice>(
            value: choice,
            child: Row(children: [
              Padding(
                child: Icon(
                  choice.icon,
                  color: iconStyle.color,
                  size: iconStyle.size,
                ),
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              ),
              Text(choice.title, style: textStyle)
            ]),
          );
        }).toList();
      },
    );
  }
}
