import 'package:flutter/material.dart';
import 'package:staycheck/component/changepassword_form.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const routerName = '/changePasswordScreen';

  const ChangePasswordScreen({Key? key}) : super(key: key);

  Widget loginImageArea(context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.all(25),
      child: (Image.asset('assets/images/changepassword.png')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: [loginImageArea(context), ChangePassword()],
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
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
