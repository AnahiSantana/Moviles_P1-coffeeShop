import 'package:estructura_practica_1/profile.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  Payment({Key key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  paymentConfirm() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/c/c5/Roasted_coffee_beans.jpg",
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Row(
                children: <Widget>[
                  Image.network(
                    "https://cdn2.iconfinder.com/data/icons/circular-icons-filled/78/Circular_Mug-512.png",
                    width: 40,
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("¡Orden exitosa!"),
                        Text("Taza Cupping"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Tu orden ha sido registrada. Para más información busca en la opción historial de compras de tu perfil.",
            ),
            FlatButton(
              child: new Text(
                "ACEPTAR",
                style: TextStyle(
                    color: Colors.purple, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pagos"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 10, 0, 0),
              child: Text(
                "Elige tu método de pago:",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            GestureDetector(
              onTap: paymentConfirm,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  height: 150,
                  width: 400,
                  child: Card(
                    elevation: 4.0,
                    color: ACCENT_COLOR,
                    child: Row(
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                "https://cdn3.iconfinder.com/data/icons/cash-card-starters-glyph/48/Sed-08-512.png",
                                height: 115,
                                width: 115,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tarjeta de crédito",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.create_outlined),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: paymentConfirm,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  height: 150,
                  width: 400,
                  child: Card(
                    elevation: 4.0,
                    color: ACCENT_COLOR,
                    child: Row(
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                "https://cdn3.iconfinder.com/data/icons/cash-card-starters-glyph/48/Sed-08-512.png",
                                height: 115,
                                width: 115,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "PayPal",
                              style: Theme.of(context).textTheme.headline5,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(110, 0, 8, 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.create_outlined),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: paymentConfirm,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  height: 150,
                  width: 400,
                  child: Card(
                    elevation: 4.0,
                    color: ACCENT_COLOR,
                    child: Row(
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                "https://cdn3.iconfinder.com/data/icons/cash-card-starters-glyph/48/Sed-08-512.png",
                                height: 115,
                                width: 115,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tarjeta de regalo",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 8, 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.create_outlined),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
