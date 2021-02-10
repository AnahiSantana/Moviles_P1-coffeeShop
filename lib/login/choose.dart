import 'package:estructura_practica_1/login/login.dart';
import 'package:estructura_practica_1/login/sign_up.dart';
import 'package:flutter/material.dart';

class Choose extends StatelessWidget {
  const Choose({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 80, 50, 100),
            child: Image.asset('assets/images/cupping_logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 50, 40),
            child: MaterialButton(
              child: Text("REGISTRATE"),
              color: Theme.of(context).accentColor,
              minWidth: 300,
              height: 50,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUp();
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 50, 50),
            child: MaterialButton(
              child: Text("INGRESA"),
              color: Theme.of(context).accentColor,
              minWidth: 300,
              height: 50,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Login();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
