import 'package:estructura_practica_1/drinks/item_hot_drinks_details.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class ItemHotDrinks extends StatefulWidget {
  final ProductHotDrinks drink;
  ItemHotDrinks({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  _ItemHotDrinksState createState() => _ItemHotDrinksState();
}

class _ItemHotDrinksState extends State<ItemHotDrinks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: GestureDetector(
        onTap: _openDetails,
        child: Card(
          elevation: 4.0,
          margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Café"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${widget.drink.productTitle}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${widget.drink.productPrice}"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Image.network(
                  "${widget.drink.productImage}",
                  fit: BoxFit.contain,
                  height: 130,
                  width: 130,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                        widget.drink.liked
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: widget.drink.liked
                            ? Theme.of(context).primaryColor
                            : null),
                    onPressed: () {
                      setState(() {
                        widget.drink.liked = !widget.drink.liked;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openDetails() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ItemHotDrinksDetails();
        },
      ),
    );
  }
}
