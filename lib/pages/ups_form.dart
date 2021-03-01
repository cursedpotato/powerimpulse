import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:powerimpulse2/widgets/fields.dart';

class UPSForm extends StatefulWidget {
  UPSForm({Key key}) : super(key: key);

  @override
  _UPSFormState createState() => _UPSFormState();
}

class _UPSFormState extends State<UPSForm> {
  int _currentStep = 0;
  String _empresa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formularios'),
        centerTitle: true,
      ),
      body: Form(
        child: Stepper(
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

  List<Step> _stepper() {
    List<Step> _steps = [
      Step(title: Text('Información general'), content: _firstStep()),
      Step(title: Text('Parámetros de operación'), content: _secondStep()),
      Step(title: Text('Parámetros de baterias'), content: _thirdStep()),
      Step(title: Text('Revisiones'), content: _forthStep()),
      Step(title: Text('Alarmas en historial'), content: _fifthStep()),
      Step(title: Text('Firma y observaciones'), content: _sixthStep()),
    ];
    return _steps;
  }

  Widget _firstStep() {
    return Column(
      children: <Widget>[
        //TODO: Servicio
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
        textField(context, "Baterias" , (String value) {
            _empresa = value;
          }),
        textField(context, "Otros"    , (String value) {
            _empresa = value;
          }),
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
    return Column(
      children: <Widget>[
        textField(context, "T°C ambiente"        , (String value) {
            _empresa = value;
          }),
        textField(context, "T°C interior UPS"    , (String value) {
            _empresa = value;
          }),
        textField(context, "Sonido emitido"      , (String value) {
            _empresa = value;
          }),
        textField(context, "Estado de pantalla"  , (String value) {
            _empresa = value;
          }),
        textField(context, "Indicadores"         , (String value) {
            _empresa = value;
          }),
        textField(context, "Limpieza de filtro"  , (String value) {
            _empresa = value;
          }),
        textField(context, "Limpieza de UPS"     , (String value) {
            _empresa = value;
          }),
        textField(context, "Limpieza de Baterias", (String value) {
            _empresa = value;
          }),
        textField(context, "Estado gabinite"     , (String value) {
            _empresa = value;
          }),
        textField(context, "Tarjeta de red"      , (String value) {
            _empresa = value;
          }),
        textField(context, "Interruptores UPS"   , (String value) {
            _empresa = value;
          }),
        
      ],
    );
  }

  Widget _forthStep() {
    return Column(
      children: <Widget>[
        //TODO: Estado cargador
        textField(context, "Voltaje nominal", (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaj cargador", (String value) {
            _empresa = value;
          }),
        textField(context, "T°C de bateria" , (String value) {
            _empresa = value;
          }),
        textField(context, "N° de bancos"   , (String value) {
            _empresa = value;
          }),
        textField(context, "Fecha bateriass", (String value) {
            _empresa = value;
          }),
      ],
    );
  }

  Widget _fifthStep() {
    return Column(
      children: <Widget>[
        textField(context, "1", (String value) {
            _empresa = value;
          }),
        textField(context, "2", (String value) {
            _empresa = value;
          }),
        textField(context, "3", (String value) {
            _empresa = value;
          }),
        textField(context, "4", (String value) {
            _empresa = value;
          }),
        textField(context, "5", (String value) {
            _empresa = value;
          }),
      ],
    );
  }

  Widget _sixthStep() {
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