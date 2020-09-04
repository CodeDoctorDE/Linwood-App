import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class EditorPage extends StatefulWidget {
  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  TextEditingController _textEditingController = TextEditingController();
  String data = "Test";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              title: Text("Edit wiki"),
              bottom: TabBar(tabs: [
                Tab(icon: Icon(MdiIcons.fileEditOutline), text: "Edit"),
                Tab(icon: Icon(MdiIcons.eyeOutline), text: "Preview")
              ])),
          body: TabBarView(children: [
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                  controller: _textEditingController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: GoogleFonts.roboto(),
                  onChanged: (value) => setState(() => data = value),
                  decoration: InputDecoration(hintText: "Content")),
            ),
            Container(
                margin: EdgeInsets.all(20),
                child: DefaultTextStyle(
                    child: Builder(
                        builder: (context) => Markdown(
                            data: data,
                            styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context).copyWith(
                                textTheme:
                                    GoogleFonts.robotoTextTheme(Theme.of(context).textTheme))),
                            onTapLink: (url) async {
                              if (await canLaunch(url)) {
                                await launch(url, forceWebView: true);
                              } else {
                                throw 'Could not launch $url';
                              }
                            })),
                    style: GoogleFonts.roboto()))
          ]),
        ));
  }
}
