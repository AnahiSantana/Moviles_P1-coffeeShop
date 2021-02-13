import 'package:flutter/material.dart';
import 'package:estructura_practica_1/cart/item_cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

class Cart extends StatefulWidget {
  final List<ProductItemCart> productsList;
  Cart({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var item in widget.productsList) {
      _total += (item.productPrice * item.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de compras"),
        centerTitle: true,
        actions: [],
      ),
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.68,
                child: ListView.builder(
                  itemCount: widget.productsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemCart(
                      onAmountUpdated: _priceUpdate,
                      product: widget.productsList[index],
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
            child: Row(
              children: [
                Text(
                  "Total",
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 32),
            child: Row(
              children: [
                Text(
                  "\$$_total MX",
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: MaterialButton(
              child: Text("PAGAR"),
              color: Theme.of(context).accentColor,
              minWidth: 300,
              height: 50,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }
}
