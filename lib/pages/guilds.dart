import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:linwood_app/pages.dart';
import 'package:linwood_app/models/guild.dart';
import 'package:linwood_app/services/api_service.dart';
import 'package:linwood_app/widgets/home/scaffold.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class GuildsPage extends StatelessWidget {
  final ApiService apiService = GetIt.I.get<ApiService>();
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
        body: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: FutureBuilder(
                future: apiService.fetchGuilds(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    var guilds = snapshot.data;
                    return SingleChildScrollView(
                        child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      children: List.generate(guilds.length, (index) {
                        var guild = guilds[index];
                        return Card(
                            child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                                child: Column(
                                  children: [
                                    if (guild.icon != null)
                                      Opacity(
                                          opacity: guild.added ? 1 : 0.3,
                                          child: Image.network(
                                            guild.icon,
                                            fit: BoxFit.cover,
                                            height: 120,
                                          )),
                                    SizedBox(height: 10),
                                    Text(guild.name),
                                    (guild.added)
                                        ? RaisedButton.icon(
                                            onPressed: () => Navigator.of(context)
                                                .pushNamed(RoutePages.guild, arguments: guild.id),
                                            icon: Icon(MdiIcons.viewDashboardOutline),
                                            label: Text("Manage"))
                                        : RaisedButton.icon(
                                            onPressed: () {
                                              launch("https://invite.linwood.tk");
                                            },
                                            icon: Icon(MdiIcons.send),
                                            label: Text("Add bot"))
                                  ],
                                )));
                      }),
                    ));
                  } else
                    return CircularProgressIndicator();
                })),
        pageTitle: "Guilds");
  }
}
