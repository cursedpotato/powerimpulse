import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:powerimpulse2/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Colores
  final rojoAppcore = Color.fromRGBO(171, 26, 45, 1);
  final azulPW      = Color.fromRGBO(0, 60, 119, 1);
  final claroPW     = Color.fromRGBO(184, 210, 250, 1);
  final acentoPW    = Color.fromRGBO(61, 91, 169, 1);
  // Imagenes (png)
  final appcoreLogo = AssetImage('assets/appcore-logo.png');
  final pwBanner    = AssetImage('assets/pw-banner.png');
  final pwLogo      = AssetImage('assets/pw-logo.png');
  final pwTitle     = AssetImage('assets/pw-title.png');
  final pwSubtitle  = AssetImage('assets/pw-subtitle.png');
  // Svg
  final String appcoreLogoS = 'assets/appcore_logo.svg';
  final String pwBannerS    = 'assets/pw-banner.svg';
  final String pwBasicoS    = 'assets/pw-basico.svg';
  final String pwLogoS      = 'assets/pw-logo.svg';
  final String pwTitleS     = 'assets/pw-title.svg';
  final String pwSubtitleS  = 'assets/pw-subtitle.svg';

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Power Impulse',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(238, 238, 238, 1),
        fontFamily: 'Poppins',
        primaryColor: azulPW,
        primaryColorDark: rojoAppcore,
        primaryColorLight: claroPW,
        accentColor: acentoPW,
      ),
      home: HomePage(),
    );
  }
}

// final String assetName = 'assets/image_that_does_not_exist.svg';
// final Widget svg = SvgPicture.asset(
//   assetName,
// );