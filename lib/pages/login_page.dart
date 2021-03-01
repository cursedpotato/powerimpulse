import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:powerimpulse2/models/login_model.dart';
import 'package:powerimpulse2/providers/api_service.dart';

import '../ProgressHUD.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  LoginRequestModel loginRequestModel;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                
                _whiteContainer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _whiteContainer() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).hintColor.withOpacity(0.2),
              offset: Offset(0, 10),
              blurRadius: 20)
        ],
      ),
      child: _loginForm(),
    );
  }

  Widget _loginForm() {
    return Form(
      key: globalFormKey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 25),
          _logintitle(),
          SizedBox(height: 20),
          _emailField(),
          SizedBox(height: 20),
          _passwordField(),
          SizedBox(height: 30),
          _submitButton(),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _logintitle() {
    return Text(
      "INGRESAR",
      style: TextStyle(
          fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  Widget _emailField() {
    return new TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (input) => loginRequestModel.email = input,
      validator: (input) =>
          !input.contains('@') ? "Ingresa un Email válido" : null,
      decoration: new InputDecoration(
        hintText: "Correo Electrónico",
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).accentColor.withOpacity(0.2))),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).accentColor)),
        prefixIcon: Icon(
          Icons.email,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }

  Widget _passwordField() {
    return new TextFormField(
      style: TextStyle(color: Theme.of(context).accentColor),
      keyboardType: TextInputType.text,
      onSaved: (input) => loginRequestModel.password = input,
      validator: (input) =>
          input.length < 3 ? "La contraseña debe tenerr al menos 6 carácteres" : null,
      obscureText: hidePassword,
      decoration: new InputDecoration(
        hintText: "Contraseña",
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).accentColor.withOpacity(0.2))),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).accentColor)),
        prefixIcon: Icon(
          Icons.lock,
          color: Theme.of(context).accentColor,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          color: Theme.of(context).accentColor.withOpacity(0.4),
          icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return FlatButton(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 80),
      onPressed: () {
        if (validateAndSave()) {
          print(loginRequestModel.toJson());

          setState(() {
            isApiCallProcess = true;
          });

          APIService apiService = new APIService();
          apiService.login(loginRequestModel).then((value) {
            if (value != null) {
              setState(() {
                isApiCallProcess = false;
              });

              if (value.token.isNotEmpty) {
                final snackBar = SnackBar(content: Text("Ingreso exitoso"));
                scaffoldKey.currentState.showSnackBar(snackBar);
                Navigator.of(context).push(_createRoute());
              } else {
                final snackBar = SnackBar(content: Text(value.error));
                scaffoldKey.currentState.showSnackBar(snackBar);
              }
            }
          });
        }
      },
      child: Text(
        "Enviar",
        style: TextStyle(color: Colors.white),
      ),
      color: Theme.of(context).accentColor,
      shape: StadiumBorder(),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
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
