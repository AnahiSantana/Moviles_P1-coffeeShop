import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  final dynamic product;
  final ValueChanged<double> onAmountUpdated;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.product,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Theme.of(context).splashColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  "${widget.product.productImage}",
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Text(
                      "${widget.product.productTitle}",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      "\$${widget.product.productPrice}",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: _addProd),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "${widget.product.productAmount}",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        IconButton(
                            icon: Icon(Icons.remove_circle),
                            onPressed: _remProd),
                        SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(
                          widget.product.liked
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: widget.product.liked
                              ? Theme.of(context).primaryColor
                              : null),
                      onPressed: () {},
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: _deleteProduct,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _remProd() {
    if (widget.product.productAmount > 0) {
      setState(() {
        --widget.product.productAmount;
      });
      widget.onAmountUpdated(-1 * widget.product.productPrice);
    }
    if (widget.product.productAmount == 0) {
      cartlist.remove(widget.product);
    }
  }

  void _deleteProduct() {
    widget.onAmountUpdated(
        -1 * widget.product.productPrice * widget.product.productAmount);
    cartlist.remove(widget.product);
  }
}
