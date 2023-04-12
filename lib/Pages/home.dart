import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/Pages/widgets/categories_custom_container.dart';
import 'package:movie_app/Pages/widgets/container_custom_widget.dart';

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
                              'Welcome Binayak',
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
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 61, 58, 58),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 15),
                                    border: InputBorder.none,
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: GestureDetector(
                                  onTap: null,
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )),
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
                                  CategoryCustomWidget(),
                                  CategoryCustomWidget(),
                                  CategoryCustomWidget(),
                                  CategoryCustomWidget(),
                                  CategoryCustomWidget(),
                                  CategoryCustomWidget(),
                                  CategoryCustomWidget(),
                                  CategoryCustomWidget(),
                                  CategoryCustomWidget(),
                                  CategoryCustomWidget()
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
                // this container is for latest movies
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 25),
                      child: Row(
                        //this row is for latest movies and view all
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Favorite Movie',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
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
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://cdn.cinematerial.com/p/297x/nza9lluu/top-gun-maverick-movie-poster-md.jpg?v=1648561333',
                            ),
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://m.media-amazon.com/images/I/81rdqYavf9L._AC_UL400_.jpg',
                            ),
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://m.media-amazon.com/images/I/61lla1CLIPL._AC_UL400_.jpg',
                            ),
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://m.media-amazon.com/images/I/714ggzDEOSL._AC_UL400_.jpg',
                            ),
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://upload.wikimedia.org/wikipedia/en/9/95/Thor_%28film%29_poster.jpg',
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                //this container for favourite movies
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 25),
                      child: Row(
                        //this row is for latest movies and view all
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Comedy Movie',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
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
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://m.media-amazon.com/images/I/61xw5M+AKTL._AC_UL400_.jpg',
                            ),
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://m.media-amazon.com/images/I/814lLzbrkOL._AC_UL400_.jpg',
                            ),
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://m.media-amazon.com/images/I/81Xr+rqVmFL._AC_UL400_.jpg',
                            ),
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://upload.wikimedia.org/wikipedia/en/9/95/Thor_%28film%29_poster.jpg',
                            ),
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://upload.wikimedia.org/wikipedia/en/9/95/Thor_%28film%29_poster.jpg',
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 25),
                      child: Row(
                        //this row is for latest movies and view all
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Crime Movie',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
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
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://i.ebayimg.com/images/g/5ogAAOSw6JlfVPKh/s-l500.jpg',
                            ),
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://m.media-amazon.com/images/I/61xw5M+AKTL._AC_UL400_.jpg',
                            ),
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://i.ebayimg.com/images/g/5ogAAOSw6JlfVPKh/s-l500.jpg',
                            ),
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://m.media-amazon.com/images/I/61xw5M+AKTL._AC_UL400_.jpg',
                            ),
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://m.media-amazon.com/images/I/81Xr+rqVmFL._AC_UL400_.jpg',
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                //this container for favourite movies
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 25),
                      child: Row(
                        //this row is for latest movies and view all
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Horror Movie',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
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
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://i.ebayimg.com/images/g/5ogAAOSw6JlfVPKh/s-l500.jpg',
                            ),
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://m.media-amazon.com/images/I/714ggzDEOSL._AC_UL400_.jpg',
                            ),
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://i.ebayimg.com/images/g/5ogAAOSw6JlfVPKh/s-l500.jpg',
                            ),
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://m.media-amazon.com/images/I/61xw5M+AKTL._AC_UL400_.jpg',
                            ),
                            ContainerCustomWidget(
                              NewtworkImage:
                                  'https://m.media-amazon.com/images/I/714ggzDEOSL._AC_UL400_.jpg',
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
              label: 'Play',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Bookmark',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
    );
  }
}
