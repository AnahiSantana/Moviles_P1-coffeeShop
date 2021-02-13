import 'package:estructura_practica_1/desserts/item_desserts_details.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:flutter/material.dart';

class ItemDesserts extends StatefulWidget {
  final ProductDessert dessert;
  ItemDesserts({
    Key key,
    this.dessert,
  }) : super(key: key);

  @override
  _ItemDessertsState createState() => _ItemDessertsState();
}

class _ItemDessertsState extends State<ItemDesserts> {
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
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Café",
                          style: Theme.of(context).textTheme.caption),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${widget.dessert.productTitle}",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "\$${widget.dessert.productPrice}",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Image.network(
                  "${widget.dessert.productImage}",
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                        widget.dessert.liked
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: widget.dessert.liked
                            ? Theme.of(context).primaryColor
                            : null),
                    onPressed: () {
                      setState(() {
                        widget.dessert.liked = !widget.dessert.liked;
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
          return ItemDessertsDetails(dessert: widget.dessert);
        },
      ),
    );
  }
}
