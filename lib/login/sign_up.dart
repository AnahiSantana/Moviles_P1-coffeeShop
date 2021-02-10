import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:estructura_practica_1/login/login.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool accept = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 80, 50, 20),
            child: Image.asset('assets/images/cupping_logo.png'),
          ),
          ListTile(
            title: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nombre Completo",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
          ),
          ListTile(
            title: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Email",
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
            child: Row(
              children: [
                Checkbox(
                  value: accept,
                  onChanged: (bool value) {
                    setState(() {
                      accept = value;
                    });
                  },
                ),
                Text(
                  "ACEPTO LOS TÉRMINOS Y CONDICIONES DE USO",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
            child: MaterialButton(
              child: Text("REGISTRATE"),
              color: Theme.of(context).accentColor,
              height: 50,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Home(title: APP_TITLE);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Login();
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "¿Ya tienes una cuenta?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "INGRESA",
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
