import 'package:flutter/material.dart';
import 'package:staycheck/models/product.dart';

class Product with ChangeNotifier {
  final List product = [
    Products(id: '1', title: "Paracetamol 500mg", amount: 500.000),
    Products(id: '2', title: "Crocin", amount: 300.000),
    Products(id: '3', title: "Gudlax", amount: 1500.000),
    Products(id: '4', title: "Favipiravir", amount: 5600.000),
    Products(id: '5', title: "Zecuf", amount: 200.000),
    Products(id: '6', title: "Grilinictus", amount: 50.000),
    Products(id: '7', title: "Paracetamol 500mg", amount: 20.000),
    Products(id: '8', title: "Paracetamol 500mg", amount: 2500.000),
    Products(id: '9', title: "Paracetamol 500mg", amount: 5100.000),
    Products(id: '10', title: "Paracetamol 500mg", amount: 900.000),
    Products(id: '11', title: "Paracetamol 500mg", amount: 600.000),
    Products(id: '12', title: "Paracetamol 500mg", amount: 300.000),
  ];

  List<Products> get productdata {
    return [...product];
  }
}
