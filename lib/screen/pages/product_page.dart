import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:staycheck/models/product.dart';
import 'package:staycheck/provider/cart.dart';
import 'package:staycheck/provider/product_provider.dart';
import 'package:staycheck/screen/pages/cart_page.dart';

import 'package:staycheck/widgets/app_drawer.dart';
import 'package:staycheck/widgets/badge.dart';
import 'package:staycheck/widgets/product_tile.dart';
import 'package:staycheck/widgets/serach_card.dart';

class ProductPage extends StatelessWidget {
  static const routerName = './ProductPage';
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Products> products = Provider.of<Product>(context).productdata;
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
                child: child as Widget,
                color: Colors.black,
                value: cart.itemCount.toString()),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(Cartpage.routerName);
              },
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 11,
            child: SearchCard(),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) => ProductTile(products[index], index),
              itemCount: products.length,
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}
