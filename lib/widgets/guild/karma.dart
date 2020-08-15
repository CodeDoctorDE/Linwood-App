import 'package:flutter/material.dart';
import 'package:linwood/services/member.dart';

class KarmaCard extends StatelessWidget {
  final Member member;
  const KarmaCard({Key key, this.member}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(member.tag, style: Theme.of(context).textTheme.headline6),
          Row(
            children: [
              Text(member.level.toString()),
              LinearProgressIndicator(),
              Text(member.karma)
            ],
          )
        ],
      ),
    );
  }
}
