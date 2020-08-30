import 'package:flutter/material.dart';
import 'package:linwood_app/widgets/home/scaffold.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  var notifications = [
    {
      "title": "is a title",
      "text": "Notification - 1",
      "unread": true,
      "time": DateTime.now().subtract(new Duration(minutes: 5))
    },
    {
      "title": "we lit",
      "text": "Notification - 2",
      "time": DateTime.parse("2020-01-01T00:00:00+0000")
    },
    {"text": "more...", "unread": false, "time": null}
  ];
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
        pageTitle: "Home", body: Container(child: Center(child: Text("Coming soon..."))));
  }
}
