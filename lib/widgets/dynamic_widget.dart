import 'package:flutter/material.dart';

class BatteryField extends StatefulWidget {
  BatteryField({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _BatteryFieldState();
}

class _BatteryFieldState extends State<BatteryField> {
  
  @override
  Widget build(BuildContext context) {

    return new Container(
       child: new SingleChildScrollView(
         scrollDirection: Axis.horizontal,
         child: new Column(
           children: <Widget>[
             new Text("Texto"),
             new Row(children: <Widget>[
               rowtextField(context, "Voltaje carga"),
               rowtextField(context, "Voltaje reposo"),
               rowtextField(context, "°C/mOhm")
             ],)
           ],
         ),
       ),
    );
  }

  Widget rowtextField(context, texto) {
  final _screenSize = MediaQuery.of(context).size;
  return new Container(
    width: _screenSize.width * 0.25,
    margin: new EdgeInsets.symmetric(vertical: 5.0),
      child: new TextFormField(
      maxLength: 20,
      decoration: new InputDecoration(
          labelText: texto,
          labelStyle: TextStyle(color: Theme.of(context).accentColor),
          hintText: texto,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).accentColor,
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).accentColor,
              width: 1,
            ),
          ),
          prefixIcon: Icon(
            Icons.arrow_right,
            color: Theme.of(context).accentColor,
          ),
        ),
    ),
  );
}
}