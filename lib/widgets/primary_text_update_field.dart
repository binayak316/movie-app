import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

typedef void OnChangedCallback(String value);

class PrimaryUpdateTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String? initialvalue;
  final Icon? prefixIcon;
  final TextInputType? keyboardType;
  final OnChangedCallback? onChanged;

  const PrimaryUpdateTextFormField(
      {this.validator,
      required this.prefixIcon,
      this.keyboardType,
      this.onChanged,
      this.initialvalue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      initialValue: initialvalue,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(10)),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 5, color: Colors.orange),
            borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Color.fromARGB(255, 233, 233, 233),
        prefixIcon: prefixIcon,
      ),
      validator: validator,
      style: TextStyle(fontSize: 15),
    );
  }
}
