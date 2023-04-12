import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CategoryCustomWidget extends StatelessWidget {
  const CategoryCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Action',
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
