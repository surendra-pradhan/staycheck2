import 'package:flutter/cupertino.dart';
import 'package:staycheck/screen/allservice_screen.dart';
import 'package:staycheck/screen/auth/changepassword_screen.dart';
import 'package:staycheck/screen/auth/forgotpassword_screen.dart';
import 'package:staycheck/screen/auth/otp_screen.dart';
import 'package:staycheck/screen/auth/signin_screen.dart';
import 'package:staycheck/screen/pages/cart_page.dart';
import 'package:staycheck/screen/pages/product_page.dart';

final Map<String, WidgetBuilder> routes = {
  ForgotPassword.routerName: (ctx) => ForgotPassword(),
  OtpScreen.routerName: (ctx) => OtpScreen(),
  ChangePasswordScreen.routerName: (ctx) => ChangePasswordScreen(),
  SigninScreen.routerName: (ctx) => SigninScreen(),
  ServiceScreen.routname: (ctx) => ServiceScreen(),
  ProductPage.routerName: (ctx) => ProductPage(),
  Cartpage.routerName: (ctx) => Cartpage()
};
