import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

//this is the custom widget which makes the dynamic of categories name lies belw the searchfield
class CategoryCustomWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onpress;
  // final ItemScrollController itemScrollController;
  const CategoryCustomWidget({required this.text, this.onpress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7),
      child: GestureDetector(
        onTap: onpress,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[700],
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
