import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:linwood_app/services/api_service.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PrefixesPage extends StatefulWidget {
  @override
  _PrefixesPageState createState() => _PrefixesPageState();
}

class _PrefixesPageState extends State<PrefixesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Prefixes")),
      body: Container(
        alignment: Alignment.topCenter,
        child: FutureBuilder(
          future: GetIt.I.get<ApiService>().fetchGuild(0),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var prefixes = snapshot.data.prefixes as List<String>;
              return ListView.builder(
                  itemCount: prefixes.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(prefixes[index]),
                        onTap: () => setState(() => prefixes.removeAt(index)),
                      ));
            } else
              return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(MdiIcons.plus),
        onPressed: () {
          showDialog(context: context, child: Column(children: [Text("Test")]));
        },
      ),
    );
  }
}
