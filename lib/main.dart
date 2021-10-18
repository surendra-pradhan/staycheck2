import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:staycheck/provider/cart.dart';
import 'package:staycheck/provider/product_provider.dart';
import 'package:staycheck/router.dart';

import 'package:staycheck/screen/main_screen.dart';

import 'package:staycheck/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Product()),
          ChangeNotifierProvider.value(value: Cart())
        ],
        child: MaterialApp(
          theme: theme(),
          home: MainScreen(),
          routes: routes,
        ));
  }
}
