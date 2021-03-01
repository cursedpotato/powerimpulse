import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:powerimpulse2/pages/form_page.dart';

enum CompanyName { AppCore, PowerImpulse }

class FormData {
  CompanyName companyName;

  FormData(this.companyName);
}

class HomePage extends StatelessWidget {
  final pW = "PowerImpulse";
  final appcore = "Appcore";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _createButtons(context, pW,),
                  _createButtons(context, appcore,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createButtons(BuildContext context, texto) {
    final _screenSize = MediaQuery.of(context).size;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: FlatButton(
          onPressed: () {
            Navigator.of(context).push(_createRoute(texto));
          },
          child: Container(
            height: _screenSize.height * 0.3,
            width: _screenSize.width * 0.4,
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(20.0)),
          ),
        ),
      ),
    );
  }


  Route _createRoute(texto) {
    return PageRouteBuilder(
      settings: RouteSettings(
        arguments: texto,
      ),
      pageBuilder: (context, animation, secondaryAnimation) => FormPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
