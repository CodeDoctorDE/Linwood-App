import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:linwood_app/models/wiki.dart';
import 'package:linwood_app/services/api_service.dart';
import 'package:linwood_app/widgets/wiki/scaffold.dart';

class WikiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: FutureBuilder(
        future: GetIt.I.get<ApiService>().fetchWiki(0),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            var wiki = snapshot.data as Wiki;
            return WikiScaffold(wiki: wiki, body: Text("WELCOME!"), pageTitle: "Home");
          } else
            return CircularProgressIndicator();
        },
      ),
    );
  }
}
