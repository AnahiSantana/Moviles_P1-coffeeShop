import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/payments/payments.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';

class ItemDessertsDetails extends StatefulWidget {
  final ProductDessert dessert;
  ItemDessertsDetails({
    Key key,
    @required this.dessert,
  }) : super(key: key);

  @override
  _ItemDessertsDetailsState createState() => _ItemDessertsDetailsState();
}

class _ItemDessertsDetailsState extends State<ItemDessertsDetails> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("${widget.dessert.productTitle}"),
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
                        "${widget.dessert.productImage}",
                        fit: BoxFit.contain,
                      ),
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
                  "${widget.dessert.productTitle}",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text("${widget.dessert.productDescription}"),
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
                        "\$${widget.dessert.productPrice}",
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
                  label: Text("Individual"),
                  selected:
                      widget.dessert.productPortion == ProductPortion.INDIVIDUAL
                          ? true
                          : false,
                  onSelected: (bool value) {
                    setState(
                      () {
                        widget.dessert.productPortion =
                            ProductPortion.INDIVIDUAL;
                        widget.dessert.productPrice =
                            widget.dessert.productPriceCalculator();
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChoiceChip(
                  label: Text("Familiar"),
                  selected:
                      widget.dessert.productPortion == ProductPortion.FAMILIAR
                          ? true
                          : false,
                  onSelected: (bool value) {
                    setState(
                      () {
                        widget.dessert.productPortion = ProductPortion.FAMILIAR;
                        widget.dessert.productPrice =
                            widget.dessert.productPriceCalculator();
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
      if (product.productTitle == widget.dessert.productTitle) {
        exists = true;
      }
    }
    if (!exists) {
      ProductItemCart product = new ProductItemCart(
          productTitle: widget.dessert.productTitle,
          productAmount: 1,
          productPrice: widget.dessert.productPrice,
          productImage: widget.dessert.productImage,
          liked: widget.dessert.liked);
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
