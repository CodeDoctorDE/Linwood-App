import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BirthdayPage extends StatelessWidget {
  final bool editing;

  const BirthdayPage({Key key, this.editing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Create birthday")),
        body: Form(
            child: ListView(
          children: [
            ListTile(
                title: Text("User"),
                onTap: editing ? () {} : null,
                subtitle: RichText(
                    text: TextSpan(
                        text: "Current: ",
                        style: Theme.of(context).textTheme.caption,
                        children: [
                      TextSpan(text: "CodeDoctor", style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: " "),
                      TextSpan(text: "(123456789)", style: TextStyle(fontStyle: FontStyle.italic))
                    ]))),
            TextFormField(
                decoration: InputDecoration(labelText: "Description"),
                maxLength: 500,
                readOnly: !editing,
                keyboardType: TextInputType.multiline),
            if (editing)
              TextFormField(
                  decoration: InputDecoration(labelText: "Message"),
                  maxLength: 500,
                  keyboardType: TextInputType.multiline)
          ],
        )),
        floatingActionButton: editing
            ? FloatingActionButton(
                child: Icon(MdiIcons.check),
                onPressed: () {},
              )
            : null);
  }
}
