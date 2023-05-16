import 'package:flutter/material.dart';

import 'package:movie_app/widgets/subWidgets/homeScreen_containers/Custom_latest.dart';
import 'package:movie_app/widgets/subWidgets/homeScreen_containers/Custom_popular.dart';
import 'package:movie_app/widgets/subWidgets/homeScreen_containers/Custom_toprated.dart';
import 'package:movie_app/widgets/subWidgets/homeScreen_containers/Custom_upcoming.dart';

import 'package:movie_app/widgets/searchBar.dart';

import '../widgets/categoriesWIdget.dart';

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
                                  text: 'Popular',
                                ),
                                CategoryCustomWidget(
                                  onpress: null,
                                  text: 'Latest',
                                ),
                                CategoryCustomWidget(
                                  onpress: null,
                                  text: 'Up Coming',
                                ),
                                CategoryCustomWidget(
                                  onpress: null,
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
