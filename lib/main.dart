import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:linwood_app/pages.dart';
import 'package:linwood_app/pages/guild/user/birthday.dart';
import 'package:linwood_app/pages/guild/user/calendar.dart';
import 'package:linwood_app/pages/guild/admin/prefixes.dart';
import 'package:linwood_app/pages/guild/admin/settings.dart';
import 'package:linwood_app/pages/guild/admin/teams.dart';
import 'package:linwood_app/pages/guilds.dart';
import 'package:linwood_app/pages/home.dart';
import 'package:linwood_app/pages/notification.dart';
import 'package:linwood_app/pages/session/callback_mobile.dart'
    if (dart.library.html) 'package:linwood_app/pages/session/callback_web.dart';

import 'package:linwood_app/pages/session/intro.dart';
import 'package:linwood_app/pages/settings.dart';
import 'package:linwood_app/pages/user.dart';
import 'package:linwood_app/pages/wikis.dart';
import 'package:linwood_app/services/api_service.dart';
import 'package:linwood_app/services/config_service.dart';
import 'package:linwood_app/theme.dart';
import 'package:linwood_app/pages/session/login_mobile.dart'
    if (dart.library.html) 'package:linwood_app/pages/session/login_web.dart';
import 'package:linwood_app/widgets/wiki/editor.dart';

import 'pages/guild/user/home.dart';
import 'pages/wiki/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromPathIntoKey("assets/config.json", "config");
  GetIt.I.registerSingleton(ApiService());
  GetIt.I.registerSingleton(ConfigService());
  await Hive.initFlutter();
  await Hive.openBox('settings');
  final themeController = ThemeController();
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
                  // visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.green,
                  accentColor: Colors.orange,
                  fontFamily: "Chilanka",
                  // visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                routes: {
                  RoutePages.intro: (_) => IntroPage(),
                  RoutePages.login: (_) => LoginPage(),
                  RoutePages.home: (_) => HomePage(),
                  RoutePages.editor: (_) => EditorPage(),
                  RoutePages.callback: (_) => CallbackPage(),
                  RoutePages.guild: (_) => GuildPage(),
                  RoutePages.adminSettings: (_) => AdminSettingsPage(),
                  RoutePages.createBirthday: (_) => BirthdayPage(),
                  RoutePages.calendar: (_) => CalendarPage(),
                  RoutePages.prefixes: (_) => PrefixesPage(),
                  RoutePages.guilds: (_) => GuildsPage(),
                  RoutePages.user: (_) => UserPage(),
                  RoutePages.wiki: (_) => WikiPage(),
                  RoutePages.wikis: (_) => WikisPage(),
                  RoutePages.notification: (_) => NotificationPage(),
                  RoutePages.teams: (_) => TeamsPage(),
                  RoutePages.settings: (_) => SettingsPage()
                },
                initialRoute: RoutePages.intro,
              ));
        });
  }
}

class AppRouteObserver extends RouteObserver<PageRoute> {
  factory AppRouteObserver() => _instance;

  AppRouteObserver._private();

  static final AppRouteObserver _instance = AppRouteObserver._private();
}
