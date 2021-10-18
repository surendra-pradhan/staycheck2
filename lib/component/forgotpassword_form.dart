import 'package:flutter/material.dart';
import 'package:staycheck/screen/auth/otp_screen.dart';
import 'package:staycheck/widgets/input_field.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  Map<String, dynamic> _getFormData = {"username": ''};
  _getusername(val) {
    _getFormData = {"username": val};
  }

  _customemailValildation(val) {
    if (val == null || val == '') {
      return "Username/Phone No. field should not be empty";
    } else if (!val.contains('@')) {
      return "email is invalid";
    } else {
      return;
    }
  }

  final _formKey = GlobalKey<FormState>();

  _saveForm() {
    var _formSatate = _formKey.currentState;

    _formSatate?.validate();
    if (_formSatate!.validate()) {
      _formSatate.save();
      Navigator.of(context).pushNamed(OtpScreen.routerName);
      print(_getFormData);
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
                label: 'Ener Your Username/Mobile No.',
                getval: (val) => _getusername(val),
                inputAction: TextInputAction.done,
                obsc: false,
                validation: (val) => _customemailValildation(val)),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(OtpScreen.routerName);
                },
                child: Text(
                  'Already have an OTP ?',
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
                  ElevatedButton(onPressed: _saveForm, child: Text('Get OTP')),
            )
          ],
        ),
      ),
    );
  }
}
