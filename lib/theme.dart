import 'package:flutter/material.dart';

import './constant.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: kPrimaryColor,
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: kSecondaryColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            kPrimaryColor,
          ), //button color
          foregroundColor: MaterialStateProperty.all<Color>(
            Colors.white,
          ), //text (and icon)
        ),
      ));
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
    headline1: TextStyle(
        fontFamily: 'Sanspro',
        fontSize: 13,
        color: Colors.white,
        fontWeight: FontWeight.bold),
    headline2: TextStyle(
        letterSpacing: 3.0,
        fontSize: 35,
        fontWeight: FontWeight.bold,
        fontFamily: 'header'),
  );
}

AppBarTheme appBarTheme() {
  // ignore: prefer_const_constructors
  return AppBarTheme(
    color: kPrimaryColor,
    elevation: 0,
    brightness: Brightness.light,
    // ignore: prefer_const_constructors
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    gapPadding: 10,
    borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
  );
  return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      focusedErrorBorder: outlineInputBorder,
      errorBorder: outlineInputBorder);
}
