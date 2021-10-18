import 'package:flutter/material.dart';
import 'package:staycheck/screen/auth/changepassword_screen.dart';
import 'package:staycheck/widgets/input_field.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  Map<String, dynamic> _otpdata = {"otp": ''};
  final _formKey = GlobalKey<FormState>();

  _saveForm() {
    var _formSatate = _formKey.currentState;
    _formSatate?.validate();
    if (_formSatate!.validate()) {
      _formSatate.save();
      print(_otpdata);
      Navigator.of(context).pushNamed(ChangePasswordScreen.routerName);
    } else {
      return;
    }
  }

  _getusername(val) {
    _otpdata = {"otp": val};
  }

  _customemailValildation(val) {
    if (val == null || val == '') {
      return "OTP Field Should Not be Empty";
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
                label: 'Ener Your OTP.',
                getval: (val) => _getusername(val),
                inputAction: TextInputAction.done,
                obsc: false,
                validation: (val) => _customemailValildation(val)),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: _saveForm, child: Text('Change Password')),
            )
          ],
        ),
      ),
    );
  }
}
