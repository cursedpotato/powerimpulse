import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:powerimpulse2/widgets/fields.dart';

class GeneratorForm extends StatefulWidget {
  GeneratorForm({Key key}) : super(key: key);

  @override
  _GeneratorFormState createState() => _GeneratorFormState();
}

class _GeneratorFormState extends State<GeneratorForm> {
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
      Step(title: Text('Condiciones de operación'), content: _secondStep()),
      Step(title: Text('Parámetros de operación'), content: _thirdStep()),
      Step(title: Text('Pruebas de operación (sin carga)'), content: _forthStep()),
      Step(title: Text('Pruebas de operación (con carga)'), content: _fifthStep()),
      Step(title: Text('Operación de protecciones'), content: _sixthStep()),
      Step(title: Text('Firma y observaciones'), content: _seventhStep()),
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
        //TODO: Estado del equipo al inicio y final
      ],
    );
  }

  Widget _secondStep() {
    return Column(
      children: <Widget>[
        textField(context, "Horas de operación"          , (String value) {
            _empresa = value;
          }),
        textField(context, "Filtro de lubricante"        , (String value) {
            _empresa = value;
          }),
        textField(context, "Filtro de combustible"       , (String value) {
            _empresa = value;
          }),
        textField(context, "Filtro de refrigerante"      , (String value) {
            _empresa = value;
          }),
        textField(context, "Filtro de aire"              , (String value) {
            _empresa = value;
          }),
        textField(context, "Electrolito de baterías"     , (String value) {
            _empresa = value;
          }),
        textField(context, "Nivel de refrigerante"       , (String value) {
            _empresa = value;
          }),
        textField(context, "Nivel de combustible"        , (String value) {
            _empresa = value;
          }),
        textField(context, "Nivel de lubricante"         , (String value) {
            _empresa = value;
          }),
        textField(context, "Fugas de combustible"        , (String value) {
            _empresa = value;
          }),
        textField(context, "Fugas de combustible"        , (String value) {
            _empresa = value;
          }),
        textField(context, "Fugas de refrigerantes"      , (String value) {
            _empresa = value;
          }),
        textField(context, "Estado de mangueras"         , (String value) {
            _empresa = value;
          }),
        textField(context, "Estado de bandas"            , (String value) {
            _empresa = value;
          }),
        textField(context, "Estado de precalentador"     , (String value) {
            _empresa = value;
          }),
        textField(context, "Terminales de bateria"       , (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaje de batería en reposo", (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaje de batería en carga" , (String value) {
            _empresa = value;
          }),
      ],
    );
  }

  Widget _thirdStep() {
    return Column(
      children: <Widget>[
        textField(context, "Voltaje de CFE, A-B"      , (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaje de CFE, B-C"      , (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaje de CFE, C-A"      , (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaje de generador, A-B", (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaje de generador, B-C", (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaje de generador, C-A", (String value) {
            _empresa = value;
          }),
        textField(context, "Amperaje de carga A"      , (String value) {
            _empresa = value;
          }),
        textField(context, "Amperaje de carga B"      , (String value) {
            _empresa = value;
          }),
        textField(context, "Amperaje de carga C"      , (String value) {
            _empresa = value;
          }),
      ],
    );
  }

  Widget _forthStep() {
    return Column(
      children: <Widget>[
        textField(context, "Presión de lubricante"      , (String value) {
            _empresa = value;
          }),
        textField(context, "Temperatura de motor"       , (String value) {
            _empresa = value;
          }),
        textField(context, "Temperatura de refrigerante", (String value) {
            _empresa = value;
          }),
        textField(context, "Transferencia(seg)"         , (String value) {
            _empresa = value;
          }),
        textField(context, "Retransferencia(seg)"       , (String value) {
            _empresa = value;
          }),
        textField(context, "Emisión de ruido"           , (String value) {
            _empresa = value;
          }),
        textField(context, "Emisión de humo"            , (String value) {
            _empresa = value;
          }),
      ],
    );
  }

  Widget _fifthStep() {
    return Column(
      children: <Widget>[
        textField(context, "Presión de lubricante"       , (String value) {
            _empresa = value;
          }),
        textField(context, "Temperatura de motor"        , (String value) {
            _empresa = value;
          }),
        textField(context, "Temperatura de refrigerante" , (String value) {
            _empresa = value;
          }),
        textField(context, "Frecuencia generada"         , (String value) {
            _empresa = value;
          }),
        textField(context, "Revoluciones por minuto"     , (String value) {
            _empresa = value;
          }),
        textField(context, "Voltaje cargador de baterías", (String value) {
            _empresa = value;
          }),
        textField(context, "Lecturas del contralador"    , (String value) {
            _empresa = value;
          }),
      ],
    );
  }

  Widget _sixthStep() {
    return Column(
      children: <Widget>[
        textField(context, "Paros de emergencia", (String value) {
            _empresa = value;
          }),
        textField(context, "Sobrevelocidad"     , (String value) {
            _empresa = value;
          }),
        textField(context, "Sobretemperatura"   , (String value) {
            _empresa = value;
          }),
        textField(context, "Falta de lubricante", (String value) {
            _empresa = value;
          }),
      ],
    );
  }

  Widget _seventhStep() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: <Widget>[
          textField(context,"Actividades generales, observaciones y recomendaciones", (String value) {
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