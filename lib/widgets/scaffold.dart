import 'package:flutter/material.dart';
import 'package:linwood_app/widgets/guild/drawer.dart';

mixin ResponsiveDrawer implements StatelessWidget {
  bool permanentlyDisplay;
}

/// A responsive scaffold for our application.
/// Displays the navigation drawer alongside the [Scaffold] if the screen/window size is large enough
class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold(
      {@required this.body,
      @required this.pageTitle,
      Key key,
      this.floatingActionButton,
      this.bottom,
      this.drawer,
      this.actions})
      : super(key: key);
  final List<Widget> actions;

  final ResponsiveDrawer drawer;
  final Widget body;
  final FloatingActionButton floatingActionButton;

  final PreferredSizeWidget bottom;
  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    return Row(
      children: [
        if (!displayMobileLayout)
          const GuildDrawer(
            permanentlyDisplay: true,
          )..permanentlyDisplay = true,
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              // when the app isn't displaying the mobile version of app, hide the menu button that is used to open the navigation drawer
              automaticallyImplyLeading: displayMobileLayout,
              title: Text(pageTitle),
              actions: actions,
              bottom: bottom,
            ),
            drawer: displayMobileLayout
                ? const GuildDrawer(
                    permanentlyDisplay: false,
                  )
                : null,
            body: body,
            floatingActionButton: floatingActionButton,
          ),
        )
      ],
    );
  }
}
