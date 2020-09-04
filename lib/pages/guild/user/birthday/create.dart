import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CreateBirthdayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create birthday")),
      body: Form(
          child: ListView(
        children: [
          ListTile(
              title: Text("User"),
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
              decoration: InputDecoration(hintText: "Description"),
              maxLength: 500,
              keyboardType: TextInputType.multiline),
          TextFormField(
              decoration: InputDecoration(hintText: "Message"),
              maxLength: 500,
              keyboardType: TextInputType.multiline)
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(MdiIcons.send),
        onPressed: () {},
      ),
    );
  }
}
