import 'package:flutter/material.dart';
import 'package:linwood/pages.dart';
import 'package:linwood/pages/guilds.dart';
import 'package:linwood/pages/home.dart';
import 'package:linwood/pages/notification.dart';
import 'package:linwood/pages/settings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Linwood',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        accentColor: Colors.orange,

        fontFamily: "Chilanka",
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        RoutePages.home: (_) => HomePage(),
        RoutePages.guilds: (_) => GuildsPage(),
        RoutePages.notification: (_) => NotificationPage(),
        RoutePages.settings: (_) => SettingsPage()
      },
      initialRoute: RoutePages.home,
    );
  }
}

class AppRouteObserver extends RouteObserver<PageRoute> {
  factory AppRouteObserver() => _instance;

  AppRouteObserver._private();

  static final AppRouteObserver _instance = AppRouteObserver._private();
}
