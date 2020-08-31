import 'package:flutter/material.dart';
import 'package:linwood_app/models/member.dart';
import 'package:linwood_app/models/user.dart';

class KarmaCard extends StatelessWidget {
  final Member member;
  const KarmaCard({Key key, this.member}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: member.user,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          var user = snapshot.data as User;
          if (snapshot.hasData)
            return Card(
                child: Column(
              children: [
                Text(user.tag, style: Theme.of(context).textTheme.headline6),
                Row(
                  children: [
                    Text(member.level.toString()),
                    LinearProgressIndicator(),
                    Text(member.karma.toString())
                  ],
                )
              ],
            ));
          else
            return Text("error...");
        });
  }
}
