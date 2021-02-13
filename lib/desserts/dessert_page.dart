import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/desserts/item_desserts.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';

class DessertPage extends StatelessWidget {
  final List<ProductDessert> dessertsList;
  const DessertPage({
    Key key,
    @required this.dessertsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebidas"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => Cart(productsList: cartlist)),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: dessertsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemDesserts(
            dessert: dessertsList[index],
          );
        },
      ),
    );
  }
}
