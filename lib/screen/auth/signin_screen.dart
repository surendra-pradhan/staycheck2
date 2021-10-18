import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../component/signin_form.dart';

class SigninScreen extends StatelessWidget {
  static const routerName = '/SigninScreen';

  const SigninScreen({Key? key}) : super(key: key);

  Widget loginImageArea(context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.all(25),
      child: (SvgPicture.asset("assets/images/signin.svg")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              loginImageArea(context),
              SignInForm(),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Powered By StayCheck',
              textAlign: TextAlign.center,
            ),
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
