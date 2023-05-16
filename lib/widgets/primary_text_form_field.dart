import 'package:flutter/material.dart';

class PrimaryTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final Icon prefixIcon;
  InkWell? suffixIcon;
  final bool obscureText;
  final bool? readOnly;

  final TextInputType? keyboardType;

//this is the constructor
  PrimaryTextFormField({
    this.controller,
    this.validator,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    // this.isPassword = false,
    this.obscureText = false,
    this.readOnly,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
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
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(color: Color.fromARGB(255, 185, 182, 182)),
        hintText: hintText,
      ),
      validator: validator,
      style: TextStyle(fontSize: 15),
    );
  }
}
