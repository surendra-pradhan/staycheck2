import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:staycheck/models/product.dart';
import 'package:staycheck/provider/cart.dart';

class ProductTile extends StatefulWidget {
  final Products product;
  final int index;
  const ProductTile(this.product, this.index, {Key? key}) : super(key: key);

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  get kPrimarySahde => null;
  int productQuantity = 0;
  Widget _productIncrementButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              productQuantity = productQuantity - 1;
              Provider.of<Cart>(context, listen: false).addItems(
                  widget.product.id.toString(),
                  widget.product.title,
                  widget.product.amount,
                  productQuantity);
            });
          },
          color: Colors.green,
        ),
        Center(child: Text(productQuantity.toString())),
        IconButton(
          icon: Icon(Icons.add),
          color: Colors.green,
          onPressed: () {
            setState(() {
              productQuantity = productQuantity + 1;
              Provider.of<Cart>(context, listen: false).addItems(
                  widget.product.id.toString(),
                  widget.product.title,
                  widget.product.amount,
                  productQuantity);
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color.fromRGBO(20, 245, 193, 0.15),
          ),
          width: double.infinity,
          height: 120,
          child: Center(
            child: ListTile(
              title: Text(
                widget.product.title,
              ),
              trailing: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Text(
                    'Rs: ${widget.product.amount}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: productQuantity <= 0
                          ? ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  productQuantity = productQuantity + 1;
                                });
                                Provider.of<Cart>(context, listen: false)
                                    .addItems(
                                        widget.product.id.toString(),
                                        widget.product.title,
                                        widget.product.amount,
                                        productQuantity);
                              },
                              child: Text('Add to cart'),
                            )
                          : _productIncrementButton())
                ],
              ),
            ),
          )),
    );
  }
}
