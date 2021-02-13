import 'package:flutter/material.dart';
import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:estructura_practica_1/grains/item_grains.dart';
import 'package:estructura_practica_1/models/product_grains.dart';

class GrainsPage extends StatelessWidget {
  final List<ProductGrains> grainList;
  const GrainsPage({
    Key key,
    @required this.grainList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Granos"),
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
        itemCount: grainList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemsGrains(
            grain: grainList[index],
          );
        },
      ),
    );
  }
}
