import 'package:fa_stepper/fa_stepper.dart';
import 'package:flutter/material.dart';
import 'package:powerimpulse2/models/battery_model.dart';
import 'package:powerimpulse2/widgets/dynamic_widget.dart';
import 'package:powerimpulse2/widgets/fields.dart';

class BatteryForm extends StatefulWidget {
  BatteryForm({Key key}) : super(key: key);

  @override
  _BatteryFormState createState() => _BatteryFormState();
}

  
  
class _BatteryFormState extends State<BatteryForm> {
  int _count = 1;
  BatteryHeader batteryHeader;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
        centerTitle: true,
      ),
      body: Form(
        child: Stepper(
        type: StepperType.vertical,
        steps: _stepper(),
        physics: ClampingScrollPhysics(),
        
      )),
    );
  }

  List<Step> _stepper() {
    List<Step> _steps = [
      Step(title: Text('Información general'), content: _firstStep()),
      Step(title: Text('Parámetros eléctricos'), content: _secondStep()),
      Step(title: Text('Firma y observaciones'), content: _thirdStep()),
    ];
    return _steps;
  }

  Widget _firstStep() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          textField(context, "Empresa", (String value) {
            batteryHeader.empresa = value;
          }),
          textField(context, "Ubicación", (String value) {
            batteryHeader.ubication = value;
          }),
          textField(context, "Marca", (String value) {
            batteryHeader.marca = value;
          }),
          textField(context, "Capacidad", (String value) {
            batteryHeader.capacidad = value;
          }),
          textField(context, "Modelo", (String value) {
            batteryHeader.modelo = value;
          }),
          textField(context, "Tipo", (String value) {
            batteryHeader.tipo = value;
          }),
          textField(context, "N° de Celdas", (String value) {
            batteryHeader.nCeldas = value;
          }),
          textField(context, "Impedancia", (String value) {
            batteryHeader.impedancia = value;
          }),
        ],
      ),
    );
  }

  Widget _secondStep() {
    List<Widget> _fields = new List.generate(_count, (int i) => new BatteryField());
    return new LayoutBuilder(
      builder: (context, constraint){
        return new Column(
          children: <Widget>[
            new Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: new ListView(
                scrollDirection: Axis.horizontal,
                children: _fields,
              ),
            ),
            new FlatButton(
                  onPressed: _addNewContactRow,
                  child: new Icon(Icons.add),
                ),
          ],
        );
      },
    );
    
  }
  void _addNewContactRow() {
    setState(() {
      _count = _count + 1;
    });
  }

  

  Widget _thirdStep() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: <Widget>[
          textField(context, "Actividades generales, observaciones y recomendaciones", (String value) {
            batteryHeader.empresa = value;
          }),
        ],
      ),
    );
  }

  

  
}