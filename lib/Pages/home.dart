import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/Pages/Bookmark.dart';
// import 'package:movie_app/Pages/PlayMovie.dart';
import 'package:movie_app/Pages/Profile.dart';
import 'package:movie_app/Pages/mainHomeScreen.dart';
import 'package:movie_app/api/movie.dart';
import 'package:movie_app/widgets/bottom_navigation.dart';
import 'package:movie_app/widgets/categoriesWIdget.dart';
import 'package:movie_app/widgets/container_movie.dart';
import 'package:movie_app/widgets/searchBar.dart';
import 'package:movie_app/widgets/subWidgets/container_custom_widget.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? Movie;

  int _currentIndex = 0;
  List Pages = [
    MainHomeScreenWidget(),
    // Bookmark(),
    Profile(),
    // Favourite()
  ];

  // MovieModel
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (this.mounted) {
            setState(() {
              _currentIndex = index;
            });
          }
        },

        // selectedItemColor: Colors.white,
        selectedFontSize: 10,
        unselectedFontSize: 8,
        fixedColor: Colors.red,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              // color: Colors.white,
            ),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.bookmark,
          //     // color: Colors.white,
          //   ),
          //   label: 'Bookmarks',
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
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
