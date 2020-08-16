import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:linwood/pages.dart';
import 'package:linwood/pages/guild/admin/settings.dart';
import 'package:linwood/pages/guild/admin/teams.dart';
import 'package:linwood/pages/guilds.dart';
import 'package:linwood/pages/home.dart';
import 'package:linwood/pages/notification.dart';
import 'package:linwood/pages/settings.dart';
import 'package:linwood/services/api_service.dart';
import 'package:linwood/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/guild/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton(ApiService());
  // load the shared preferences from disk before the app is started
  final prefs = await SharedPreferences.getInstance();

  // create new theme controller, which will get the currently selected from shared preferences
  final themeController = ThemeController(prefs);
  runApp(MyApp(themeController: themeController));
}

class MyApp extends StatelessWidget {
  final ThemeController themeController;

  const MyApp({Key key, this.themeController}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: themeController,
        builder: (context, _) {
          // wrap app in inherited widget to provide the ThemeController to all pages
          return ThemeControllerProvider(
              controller: themeController,
              child: MaterialApp(
                title: 'Linwood',
                themeMode: themeController.currentThemeMode,
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
                darkTheme: ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.green,
                    accentColor: Colors.orange),
                routes: {
                  RoutePages.home: (_) => HomePage(),
                  RoutePages.guild: (_) => GuildPage(),
                  RoutePages.adminSettings: (_) => AdminSettingsPage(),
                  RoutePages.guilds: (_) => GuildsPage(),
                  RoutePages.notification: (_) => NotificationPage(),
                  RoutePages.teams: (_) => TeamsPage(),
                  RoutePages.settings: (_) => SettingsPage()
                },
                initialRoute: RoutePages.home,
              ));
        });
  }
}

class AppRouteObserver extends RouteObserver<PageRoute> {
  factory AppRouteObserver() => _instance;

  AppRouteObserver._private();

  static final AppRouteObserver _instance = AppRouteObserver._private();
}
