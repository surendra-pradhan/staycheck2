import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:staycheck/provider/cart.dart';

class Cartpage extends StatelessWidget {
  static const routerName = '/cartItem';
  const Cartpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, CartItem> cartitem = Provider.of<Cart>(context).items;

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => Card(
          child: ListTile(
            leading: Text(cartitem.values.toList()[index].title),
            trailing: Text(cartitem.values.toList()[index].quantity.toString()),
          ),
        ),
        itemCount: cartitem.length,
      ),
    );
  }
}
