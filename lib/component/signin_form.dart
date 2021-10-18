import 'package:flutter/material.dart';
import 'package:staycheck/screen/allservice_screen.dart';
import 'package:staycheck/screen/auth/forgotpassword_screen.dart';

import 'package:staycheck/widgets/input_field.dart';

class SigninData {
  final String username;
  final String password;

  SigninData({required this.username, required this.password});
}

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  var _signInData = SigninData(username: '', password: '');

  final GlobalKey<FormState> _formKey = GlobalKey();

  _saveForm() {
    final form = _formKey.currentState;

    form?.validate();
    if (form!.validate()) {
      _formKey.currentState?.save();
      print(_signInData.username);
      Navigator.of(context).pushNamed(ServiceScreen.routname);
    } else {
      return;
    }
  }

  _getusername(val) {
    _signInData = SigninData(username: val, password: _signInData.password);
  }

  _getpassword(val) {
    _signInData = SigninData(username: _signInData.username, password: val);
  }

  bool icon = true;
  void _showPassword() {
    setState(() {
      icon = !icon;
    });
  }

  _customemailValildation(val) {
    if (val == '' || val == null) {
      return 'Please fill up the field first';
    } else if (!val.contains('@')) {
      return 'email is not valid';
    } else {
      return null;
    }
  }

  _customPasswordValidation(val) {
    if (val == '' || val == null) {
      return 'Please fill up the field first';
    } else if (val.length < 6) {
      return 'Password Should be 6 Character Long';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextInput(
                label: 'Ener Your Username',
                getval: (val) => _getusername(val),
                inputAction: TextInputAction.next,
                obsc: false,
                validation: (val) => _customemailValildation(val)),
            SizedBox(
              height: 20,
            ),
            TextInput(
                label: 'Ener Your Password',
                getval: (val) => _getpassword(val),
                inputAction: TextInputAction.done,
                obsc: icon,
                ico: IconButton(
                    onPressed: _showPassword,
                    icon: Icon(icon ? Icons.visibility_off : Icons.visibility)),
                validation: (val) => _customPasswordValidation(val)),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ForgotPassword.routerName);
                },
                child: Text(
                  'Forgot Password ?',
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child:
                  ElevatedButton(onPressed: _saveForm, child: Text('Sign In')),
            )
          ],
        ),
      ),
    );
  }
}
