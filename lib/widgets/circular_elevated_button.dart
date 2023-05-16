import 'package:flutter/material.dart';

class Circularr_elevated_button extends StatelessWidget {
  String btnName;

  final VoidCallback onPressed;

  Circularr_elevated_button({
    required this.btnName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange[700],
      ),
      onPressed: onPressed,
      child: Text(btnName),
    );
  }
}
