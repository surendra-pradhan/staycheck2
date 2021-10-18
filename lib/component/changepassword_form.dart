import 'package:flutter/material.dart';
import 'package:staycheck/screen/auth/signin_screen.dart';
import 'package:staycheck/widgets/input_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> changePasswordData = {
    "password": '',
    "confirmpassword": ''
  };

  _getpassword(val) {
    changePasswordData = {"password": val, "confirmpassword": ' '};
  }

  _getconfirmpassword(val) {
    changePasswordData = {"password": '', "confirmpassword": val};
  }

  _custompasswordValildation(val) {
    if (val == '' || val == null) {
      return "passwordFiled should not be empty";
    } else {
      return;
    }
  }

  _customconfirmpasswordValidation(val) {
    if (val == '' || val == null) {
      return "passwordFiled should not be empty";
    } else {
      return;
    }
  }

  _saveForm() {
    final formState = _formKey.currentState;
    formState?.save();
    formState?.validate();
    if (formState!.validate()) {
      formState.save();
      print(changePasswordData);
      Navigator.of(context).pushNamed(SigninScreen.routerName);
    } else {
      return;
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
                label: 'Ener Your New Password',
                getval: (val) => _getpassword(val),
                inputAction: TextInputAction.next,
                obsc: true,
                validation: (val) => _custompasswordValildation(val)),
            SizedBox(
              height: 20,
            ),
            TextInput(
                label: 'Confirm Password',
                getval: (val) => _getconfirmpassword(val),
                inputAction: TextInputAction.done,
                obsc: false,
                validation: (val) => _customconfirmpasswordValidation(val)),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child:
                  ElevatedButton(onPressed: _saveForm, child: Text('Get OTP')),
            )
          ],
        ),
      ),
    );
  }
}
