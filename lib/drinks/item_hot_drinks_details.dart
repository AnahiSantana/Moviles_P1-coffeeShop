import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/payments/payments.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/utils/constants.dart';

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
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("${widget.drink.productTitle}"),
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
                        onPressed: () {},
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
                Text(
                  "${widget.drink.productTitle}",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text("${widget.drink.productDescription}"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(
                        "TAMAÑOS DISPONIBLES",
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(100, 20, 20, 0),
                      child: Text(
                        "\$${widget.drink.productPrice}",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
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
                  onPressed: () {
                    _addToCart();
                  }),
              MaterialButton(
                  height: 50,
                  minWidth: 180,
                  color: Theme.of(context).accentColor,
                  child: Text("COMPRAR AHORA"),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return Payment();
                        },
                      ),
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }

  void _addToCart() {
    bool exists = false;
    for (ProductItemCart product in cartlist) {
      if (product.productTitle == widget.drink.productTitle) {
        exists = true;
      }
    }
    if (!exists) {
      ProductItemCart product = new ProductItemCart(
          productTitle: widget.drink.productTitle,
          productAmount: 1,
          productPrice: widget.drink.productPrice,
          productImage: widget.drink.productImage,
          liked: widget.drink.liked);
      cartlist.add(product);
      final snackBar = SnackBar(content: Text("Producto agregado al carrito"));
      _scaffoldKey.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    } else {
      final snackBar =
          SnackBar(content: Text("El producto ya se encontraba en el carrito"));
      _scaffoldKey.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }
}
