import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String label;
  final Function getval;
  final TextInputAction inputAction;
  final bool obsc;
  final IconButton? ico;

  final Function validation;

  // ignore: use_key_in_widget_constructors
  const TextInput({
    required this.label,
    required this.getval,
    required this.inputAction,
    required this.obsc,
    this.ico,
    required this.validation,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(label: Text(label), suffixIcon: ico),
        textInputAction: inputAction,
        obscureText: obsc,
        onSaved: (val) => getval(val),
        validator: (val) => validation(val));
  }
}
