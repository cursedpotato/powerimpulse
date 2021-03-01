import 'package:flutter/material.dart';

TimeOfDay _time = TimeOfDay.now();

TimeOfDay timePicker;
Future<Null> selectTime(BuildContext context) async {
  timePicker = await showTimePicker(
    context: context,
    initialTime: _time,
  );

  if (timePicker != null && timePicker != _time) {
    setState(() {
      _time = timePicker;
      print(_time.toString());
    });
  }
}

DateTime _date = DateTime.now();

Future<Null> _selectDate(BuildContext context) async {
  DateTime _datePicker = await showDatePicker(
    context: context,
    initialDate: _date,
    textDirection: TextDirection.ltr,
    initialDatePickerMode: DatePickerMode.day,
    selectableDayPredicate: (DateTime val) =>
        val.weekday == 6 || val.weekday == 7 ? false : true,
    firstDate: DateTime(1947),
    lastDate: DateTime(2049),
  );

  if (_datePicker != null && _datePicker != _date) {
    setState(() {
      _date = _datePicker;
      print(_date.toString());
    });
  }
}

void setState(Null Function() param0) {}

Widget dateTimeField(context, texto, tiempo) {
  final _screenSize = MediaQuery.of(context).size;
  return Container(
    width: _screenSize.width * 0.5,
    child: TextFormField(
      readOnly: true,
      decoration: new InputDecoration(
        hintText: tiempo,
        labelText: texto,
        labelStyle: TextStyle(color: Theme.of(context).accentColor),
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
      onTap: () {
        setState(() {
          if (texto == "Fecha") {
            _selectDate(context);
          } else {
            selectTime(context);
          }
        });
      },
    ),
  );
}

Widget textField(context, texto, kvalue) {

  
  final _screenSize = MediaQuery.of(context).size;
  return Container(
    width: _screenSize.width * 0.80,
    margin: new EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
      maxLength: 20,
      onSaved: kvalue,
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