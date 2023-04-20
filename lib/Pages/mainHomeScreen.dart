import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/Model/MovieModel.dart';
import 'package:movie_app/Model/MovieModelLatest.dart';
import 'package:movie_app/Model/popularModel.dart';
import 'package:movie_app/widgets/subWidgets/homeScreen_containers/Custom_latest.dart';
import 'package:movie_app/widgets/subWidgets/homeScreen_containers/Custom_popular.dart';
import 'package:movie_app/widgets/subWidgets/homeScreen_containers/Custom_toprated.dart';
import 'package:movie_app/widgets/subWidgets/homeScreen_containers/Custom_upcoming.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:movie_app/Model/MovieModelUpcoming.dart';
import 'package:movie_app/widgets/categoriesWIdget.dart';
import 'package:movie_app/widgets/container_movie.dart';
import 'package:movie_app/widgets/searchBar.dart';
import 'package:http/http.dart';
import 'dart:convert';

// String? stringResponse;
// String? stringResponse1;
// String? stringResponse2;
// // String? stringResponse3;

class MainHomeScreenWidget extends StatefulWidget {
  const MainHomeScreenWidget({Key? key});

  @override
  State<MainHomeScreenWidget> createState() => _MainHomeScreenWidgetState();
}

class _MainHomeScreenWidgetState extends State<MainHomeScreenWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //main container for whole app
        color: Colors.black, //background color for the container whole app
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Commando',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Let's relax and watch a movie !",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/download.png'),
                        radius: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: SearchCustomWidget(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 25),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Categories',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'View all',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Container(
                            height: 33,
                            //this container scrollable action , comedy romance categories of film
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                CategoryCustomWidget(
                                  onpress: null,
                                  // onpress: () {
                                  //   itemScrollController.scrollTo(
                                  //     index:
                                  //         0, // the index of the first item in the CustomPopular() class
                                  //     duration: Duration(milliseconds: 500),
                                  //     curve: Curves.easeInOut,
                                  //   );
                                  // },
                                  // itemScrollController: itemScrollController,

                                  text: 'Popular',
                                ),
                                CategoryCustomWidget(
                                  onpress: null,
                                  // onpress: () {
                                  //   itemScrollController.scrollTo(
                                  //     index: 1,
                                  //     duration: Duration(milliseconds: 500),
                                  //     curve: Curves.easeInOut,
                                  //   );
                                  // },
                                  text: 'Latest',
                                ),
                                CategoryCustomWidget(
                                  onpress: null,
                                  // onpress: () {
                                  //   itemScrollController.scrollTo(
                                  //     index: 2,
                                  //     duration: Duration(milliseconds: 500),
                                  //     curve: Curves.easeInOut,
                                  //   );
                                  // },
                                  text: 'Up Coming',
                                ),
                                CategoryCustomWidget(
                                  onpress: null,
                                  // onpress: () {
                                  //   itemScrollController.scrollTo(
                                  //     index: 3,
                                  //     duration: Duration(milliseconds: 500),
                                  //     curve: Curves.easeInOut,
                                  //   );
                                  // },
                                  text: 'Top Rated',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Column(
                children: [
                  CustomPopular(),
                  CustomLatest(),
                  CustomUpComing(),
                  CustomTopRated(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
