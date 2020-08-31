import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:linwood_app/models/wiki.dart';
import 'package:linwood_app/services/api_service.dart';
import 'package:linwood_app/widgets/home/scaffold.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../pages.dart';

class WikisPage extends StatelessWidget {
  final ApiService apiService = GetIt.I.get<ApiService>();

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
        pageTitle: "Wikis",
        body: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: FutureBuilder(
                future: apiService.fetchWikis(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    var wikis = snapshot.data as List<Wiki>;
                    return SingleChildScrollView(
                        child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      children: List.generate(wikis.length, (index) {
                        var wiki = wikis[index];
                        return Card(
                            child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Text(wiki.name),
                                    RaisedButton.icon(
                                        onPressed: () =>
                                            Navigator.of(context).pushNamed(RoutePages.wiki),
                                        icon: Icon(MdiIcons.openInApp),
                                        label: Text("Open"))
                                  ],
                                )));
                      }),
                    ));
                  } else
                    return CircularProgressIndicator();
                })));
  }
}
