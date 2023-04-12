import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/Pages/PlayMovie.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //main container for whole app
          color: Colors.black, //background color for the container whole app
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    text: 'Action',
                                  ),
                                  CategoryCustomWidget(
                                    text: 'Romance',
                                  ),
                                  CategoryCustomWidget(
                                    text: 'Crime',
                                  ),
                                  CategoryCustomWidget(
                                    text: 'Thriller',
                                  ),
                                  CategoryCustomWidget(
                                    text: 'Comedy',
                                  ),
                                  CategoryCustomWidget(
                                    text: 'Horror',
                                  ),
                                  CategoryCustomWidget(
                                    text: 'Aero Space',
                                  ),
                                  CategoryCustomWidget(
                                    text: 'Secret',
                                  ),
                                  CategoryCustomWidget(
                                    text: 'Alien Life',
                                  ),
                                  CategoryCustomWidget(
                                    text: 'Sci-Fi',
                                  )
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
              CustomCategorywiseWidget(
                preText: 'Favorite Movie',
                sufText: 'View all',
              ),
              SizedBox(
                height: 15,
              ),
              CustomCategorywiseWidget(
                preText: 'Action Movie',
                sufText: 'View all',
              ),
              SizedBox(
                height: 15,
              ),
              CustomCategorywiseWidget(
                preText: 'Crime Movie',
                sufText: 'View all',
              ),
              SizedBox(
                height: 15,
              ),
              CustomCategorywiseWidget(
                preText: 'Horror Movie',
                sufText: 'View all',
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
