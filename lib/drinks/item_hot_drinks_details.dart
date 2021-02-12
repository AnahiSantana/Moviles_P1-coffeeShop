import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class ItemHotDrinksDetails extends StatefulWidget {
  final ProductHotDrinks drink;
  ItemHotDrinksDetails({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  _ItemHotDrinksDetailsState createState() => _ItemHotDrinksDetailsState();
}

class _ItemHotDrinksDetailsState extends State<ItemHotDrinksDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.drink.productTitle}"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            height: 350,
            child: Card(
              elevation: 200.0,
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              color: Theme.of(context).splashColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Image.network(
                        "${widget.drink.productImage}",
                        fit: BoxFit.contain,
                      ),
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
          Container(
            child: Column(
              children: [
                Text("${widget.drink.productTitle}"),
                Text("${widget.drink.productDescription}"),
                Row(
                  children: [
                    Text("TAMAÑOS DISPONIBLES"),
                    Text("\$${widget.drink.productPrice}"),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChoiceChip(
                  label: Text("Chico"),
                  selected:
                      widget.drink.productSize == ProductSize.CH ? true : false,
                  onSelected: (bool value) {
                    setState(
                      () {
                        widget.drink.productSize = ProductSize.CH;
                        widget.drink.productPrice =
                            widget.drink.productPriceCalculator();
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChoiceChip(
                  label: Text("Mediano"),
                  selected:
                      widget.drink.productSize == ProductSize.M ? true : false,
                  onSelected: (bool value) {
                    setState(
                      () {
                        widget.drink.productSize = ProductSize.M;
                        widget.drink.productPrice =
                            widget.drink.productPriceCalculator();
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChoiceChip(
                  label: Text("Grande"),
                  selected:
                      widget.drink.productSize == ProductSize.G ? true : false,
                  onSelected: (bool value) {
                    setState(
                      () {
                        widget.drink.productSize = ProductSize.G;
                        widget.drink.productPrice =
                            widget.drink.productPriceCalculator();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                  height: 50,
                  minWidth: 180,
                  color: Theme.of(context).accentColor,
                  child: Text("AGREGAR AL CARRITO"),
                  onPressed: () {}),
              MaterialButton(
                  height: 50,
                  minWidth: 180,
                  color: Theme.of(context).accentColor,
                  child: Text("COMPRAR AHORA"),
                  onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
