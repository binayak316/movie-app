import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/Pages/Bookmark.dart';
import 'package:movie_app/Pages/PlayMovie.dart';
import 'package:movie_app/Pages/Profile.dart';
import 'package:movie_app/Pages/mainHomeScreen.dart';
import 'package:movie_app/Pages/widgets/bottom_navigation.dart';
import 'package:movie_app/Pages/widgets/categoriesWIdget.dart';
import 'package:movie_app/Pages/widgets/container_movie.dart';
import 'package:movie_app/Pages/widgets/searchBar.dart';
import 'package:movie_app/Pages/widgets/subWidgets/container_custom_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List Pages = [
    MainHomeScreenWidget(),
    PlayMovie(),
    Bookmark(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        // selectedItemColor: Colors.white,
        selectedFontSize: 10,
        unselectedFontSize: 8,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.home,
              // color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.play_circle_fill_rounded,
              // color: Colors.white,
            ),
            label: 'Watch',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.bookmark,
              // color: Colors.white,
            ),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.person,
              // color: Colors.white,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
    // ),
    // );
  }
}
