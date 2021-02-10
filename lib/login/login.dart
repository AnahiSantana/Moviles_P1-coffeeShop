import 'package:estructura_practica_1/login/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SECONDARY_COLOR,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 80, 50, 60),
            child: Image.asset('assets/images/cupping_logo.png'),
          ),
          ListTile(
            title: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 15),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nombre de Usuario",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
          ),
          ListTile(
            title: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            child: MaterialButton(
              child: Text("ENTRAR"),
              color: TERCEARY_COLOR,
              height: 50,
              onPressed: () {},
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "¿Olvidaste tu contraseña?",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 100, 30, 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUp();
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "¿Aun no tienes una cuenta?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "REGISTRATE",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
