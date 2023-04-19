import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmark'),
      ),
      body: Container(
        child: Column(
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/220px-Image_created_with_a_mobile_phone.png',
              width: 200, // adjust the width to fit your layout
            ),
            SizedBox(
                height: 8), // add some spacing between the image and the text
            Text(
              'My text goes here',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
