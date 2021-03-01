import 'package:fa_stepper/fa_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:powerimpulse2/widgets/fields.dart';

class AirForm extends StatefulWidget {
  AirForm({Key key}) : super(key: key);

  @override
  _AirFormState createState() => _AirFormState();
}

class _AirFormState extends State<AirForm> {
  int _currentStep = 0;
  // ignore: unused_field
  String _empresa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
        centerTitle: true,
      ),
      body: Form(
        child: FAStepper(
        type: FAStepperType.horizontal,
        steps: _stepper(),
        physics: ClampingScrollPhysics(),
        currentStep: _currentStep,
        onStepTapped: (step) {
          setState(() {
            this._currentStep = step;
          });
        },
        onStepContinue: () {
          setState(() {
            if (this._currentStep < this._stepper().length - 1) {
              this._currentStep = this._currentStep + 1;
            } else {
              print('Complete');
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (this._currentStep > 0) {
              this._currentStep = this._currentStep - 1;
            } else {
              this._currentStep = 0;
            }
          });
        },
      )),
    );
  }

  List<FAStep> _stepper() {
    List<FAStep> _steps = [
      FAStep(title: Text('Información general'), content: _firstStep()),
      FAStep(title: Text('Parámetros eléctricos y condiciones de operación'), content: _secondStep()),
      FAStep(title: Text('Firma y observaciones'), content: _thirdStep()),
    ];
    return _steps;
  }

  Widget _firstStep() {
    return Column(
      children: <Widget>[
        textField(context, "Empresa"  , (String value) {
            _empresa = value;
          }),
        textField(context, "Ubicación", (String value) {
            _empresa = value;
          }),
        textField(context, "Marca"    , (String value) {
            _empresa = value;
          }),
        textField(context, "Capacidad", (String value) {
            _empresa = value;
          }),
        textField(context, "Modelo"   , (String value) {
            _empresa = value;
          }),
        textField(context, "Serie"    , (String value) {
            _empresa = value;
          }),
        //TODO: Servicio
        //TODO: Estado del equipo al inicio y final del servicio
      ],
    );
  }

  Widget _secondStep() {
    return Column(
      children: <Widget>[
        textField(context, "Voltaje de entrada / bypass AB" , (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaje de salida AB"           , (String value) {
            _empresa = value;
          }),
        textField(context, "Volataje de entrada / bypass BC", (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaje de salida BC"           , (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaje de entradas / bypass CA", (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaje de salida CA"           , (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaje de entradas / bypass AN", (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaje de salida AN"           , (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaje de entradas / bypass BN", (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaje de salida BN"           , (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaje de entradas / bypass CN", (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaje de salida CN"           , (String value) {
            _empresa = value;
          }),
        textField(context, "Amperaje de entrada / bypass A" , (String value) {
            _empresa = value;
          }),
        textField(context, "Amperaje de salida A"           , (String value) {
            _empresa = value;
          }),
        textField(context, "Amperaje de entrada / bypass B" , (String value) {
            _empresa = value;
          }),
        textField(context, "Amperaje de salida B"           , (String value) {
            _empresa = value;
          }),
        textField(context, "Amperaje de entrada / bypass C" , (String value) {
            _empresa = value;
          }),
        textField(context, "Amperaje de salida C"           , (String value) {
            _empresa = value;
          }),
        textField(context, "Amperaje de entrada / bypass N" , (String value) {
            _empresa = value;
          }),
        textField(context, "Amperaje de salida N"           , (String value) {
            _empresa = value;
          }),
        textField(context, "Frecuencia entrada/salida"      , (String value) {
            _empresa = value;
          }),
        textField(context, "Nivel de carga"                 , (String value) {
            _empresa = value;
          }), 
        textField(context, "Voltaje de rizo rectificador"   , (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaje de salidad N-TF."       , (String value) {
            _empresa = value;
          }),
      ],
    );
  }

  Widget _thirdStep() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: <Widget>[
          textField(context, "Actividades generales, observaciones y recomendaciones", (String value) {
            _empresa = value;
          }),
          Row(
            children: <Widget>[_signatureField("Elaboró"),_signatureField("Recibió")],
          )
        ],
      ),
    );
  }

  Widget _signatureField(texto) {
    final _screenSize = MediaQuery.of(context).size;
    var color = Colors.red;
    var strokeWidth = 5.0;
    final _sign = GlobalKey<SignatureState>();
    return Column(
        children: <Widget>[
          Text(texto),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: _screenSize.width * 0.35,
              height: _screenSize.height * 0.2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Signature(
                  color: color,
                  key: _sign,
                  onSign: () {
                    final sign = _sign.currentState;
                    debugPrint('${sign.points.length} points in the signature');
                  },
                  strokeWidth: strokeWidth,
                ),
              ),
              color: Colors.black12,
            ),
          ),
          MaterialButton(
              color: Colors.grey,
              onPressed: () {
                final sign = _sign.currentState;
                sign.clear();
                debugPrint("cleared");
              },
              child: Text("Limpiar")),
        ],
    );
  }

  
}