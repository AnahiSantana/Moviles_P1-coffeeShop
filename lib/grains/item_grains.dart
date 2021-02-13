import 'package:flutter/material.dart';
import 'package:estructura_practica_1/grains/item_grains_details.dart';
import 'package:estructura_practica_1/models/product_grains.dart';

class ItemsGrains extends StatefulWidget {
  final ProductGrains grain;
  ItemsGrains({
    Key key,
    @required this.grain,
  }) : super(key: key);

  @override
  _ItemsGrainsState createState() => _ItemsGrainsState();
}

class _ItemsGrainsState extends State<ItemsGrains> {
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
                        "${widget.grain.productTitle}",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "\$${widget.grain.productPrice}",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Image.network(
                  "${widget.grain.productImage}",
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                        widget.grain.liked
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: widget.grain.liked
                            ? Theme.of(context).primaryColor
                            : null),
                    onPressed: () {
                      setState(() {
                        widget.grain.liked = !widget.grain.liked;
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
          return ItemGrainsDetails(
            grain: widget.grain,
          );
        },
      ),
    );
  }
}
