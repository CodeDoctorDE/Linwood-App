import 'package:linwood_app/pages/session/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../home.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  static final List _items = [
    {
      "header": "Welcome!",
      "description": "Swipe to get an introduction. Click on skip to skip it.",
      "image": MdiIcons.robot
    },
    {
      "header": "For users",
      "description": "Play games and configure everything without being online on discord!",
      "image": MdiIcons.plusCircleMultipleOutline
    },
    {
      "header": "For owners",
      "description":
          "Every settings in discord are configure in the app too. Don't remember all commands, use the app!",
      "image": MdiIcons.lockOutline
    }
  ];
  final _pageViewController = new PageController();
  double _currentPage = 0;
  List<Widget> indicator() => List<Widget>.generate(
      _items.length,
      (index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 3.0),
            height: 10.0,
            width: 10.0,
            child: InkWell(
              onTap: () => _setPage(index),
            ),
            decoration: BoxDecoration(
                color: _currentPage.round() == index
                    ? Color(0XFF256075)
                    : Color(0XFF256075).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0)),
          ));
  void _setPage(int index) {
    _pageViewController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Response>(
      future: http.get("https://api.linwood.tk"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator()); //CIRCULAR INDICATOR
        else {
          if (snapshot.hasData) {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
          }
          return _createWelcomePage(context);
        }
      },
    ));
  }

  Widget _createWelcomePage(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageViewController,
            itemCount: _items.length,
            itemBuilder: (BuildContext context, int index) {
              _pageViewController.addListener(() {
                setState(() {
                  _currentPage = _pageViewController.page;
                });
              });
              var item = _items[index];
              return Container(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Icon(
                        item['image'],
                        size: 150,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          children: <Widget>[
                            Text(item['header'],
                                style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0XFF3F3D56),
                                    height: 2.0)),
                            Text(
                              item['description'],
                              style: TextStyle(
                                  color: Colors.grey,
                                  letterSpacing: 1.2,
                                  fontSize: 16.0,
                                  height: 1.3),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    )
                  ]));
            },
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 70.0),
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: indicator(),
                ),
              )
              //  ),
              ),
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                  (_currentPage <= 4.5)
                      ? FlatButton(
                          onPressed: () {
                            _setPage(5);
                          },
                          child: Text("SKIP"),
                        )
                      : RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                          child: Text("START"),
                        ),
                ]),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 32),
              ))
          // )
        ],
      ),
    );
  }
}
