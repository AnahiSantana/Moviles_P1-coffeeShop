import 'package:estructura_practica_1/login/choose.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        primaryColor: PRIMARY_COLOR,
        accentColor: ACCENT_COLOR,
        cardColor: ACCENT_COLOR,
        buttonColor: ACCENT_COLOR,
        splashColor: PCOLOR,
        textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 25.0,
                fontFamily: 'AkzidenGrotesk',
                color: PRIMARY_COLOR),
            headline2: TextStyle(
                fontSize: 20.0,
                fontFamily: 'AkzidenGrotesk',
                color: PRIMARY_COLOR),
            headline3: TextStyle(
                fontSize: 18.0,
                fontFamily: 'AkzidenGrotesk',
                color: PRIMARY_COLOR),
            headline4: TextStyle(
                fontSize: 20.0, fontFamily: 'OpensSans', color: Colors.black),
            caption: TextStyle(fontSize: 12.0)),
        fontFamily: 'OpensSans',
      ),
      home: Splash2(),
    );
  }
}

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 8,
      navigateAfterSeconds: Choose(),
      imageBackground: AssetImage('assets/images/coffee.jpg'),
      image: Image.asset('assets/images/cupping_logo.png'),
      photoSize: 120.0,
    );
  }
}
