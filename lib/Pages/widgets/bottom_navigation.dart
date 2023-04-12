import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

//a bottom navigation bar a custom widget
class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: null,
      selectedItemColor: Colors.red,
      selectedFontSize: 15,
      unselectedItemColor: Colors.grey,
      unselectedFontSize: 10,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.play_arrow,
          ),
          label: 'Watch',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'Bookmark',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
