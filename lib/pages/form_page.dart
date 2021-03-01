import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:powerimpulse2/pages/air_form.dart';
import 'package:powerimpulse2/pages/battery_form.dart';
import 'package:powerimpulse2/pages/ups_form.dart';

import 'generator_form.dart';


class FormPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final texto = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(texto),
      ),
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
                  _createButtons('Generador eléctrico', context, GeneratorForm()),
                  _createButtons('Aire acondicionado', context, AirForm()),
                  _createButtons('UPS', context, UPSForm()),
                  _createButtons('Baterías', context, BatteryForm() ),

                ],
              ),
            ),
          ),          
        ],
      ),
    );
  }

Widget _createButtons( texto, BuildContext context, ruta) {
  return ClipRRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: FlatButton(
        onPressed: () {
        Navigator.of(context).push(_createRoute(ruta));  
        }, 
        child: Container(
          height: 90.0,
          width: 360.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 5.0),
              Text(texto, style: TextStyle(color: Colors.white)),
              SizedBox(height: 5.0),
            ],
          ),
        ),
      )
    ,),
  );
}

Route _createRoute(ruta) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ruta,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
 }

}