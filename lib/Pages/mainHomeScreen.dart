import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/Model/MovieModel.dart';
import 'package:movie_app/Model/MovieModelLatest.dart';
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
  const MainHomeScreenWidget({super.key});

  @override
  State<MainHomeScreenWidget> createState() => _MainHomeScreenWidgetState();
}

class _MainHomeScreenWidgetState extends State<MainHomeScreenWidget> {
  //popular movies
  Future<List<dynamic>> popularMovies() async {
    Response response = await get(Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=9355c03054950231ba8c4a88371a95af&language=en-US&page=1"));

    if (response.statusCode == 200) {
      Map stringResponse = jsonDecode(response.body);
      List<dynamic> temp_data = stringResponse['results'];
      return temp_data;
    } else {
      throw Exception('Error of the data');
    }
  }

  //toprated movies with custom MovieModel

  List<MovieModel> movielist = [];
  Future<List<MovieModel>> topratedmovies() async {
    final response = await get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=9355c03054950231ba8c4a88371a95af&language=en-US&page=1'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      List<dynamic> results = data['results'];
      for (Map<String, dynamic> i in results) {
        MovieModel moviemodel_object = MovieModel(
            poster_path: i['poster_path'], original_title: i['original_title']);
        movielist.add(moviemodel_object);
      }
      return movielist;
    } else {
      return movielist;
    }
  }

  //upcoming movies with custom MovieModelupcoming
  List<MovieModelUpcoming> movielistupcoming = [];
  Future<List<MovieModelUpcoming>> upcomingmovies() async {
    final response = await get(Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=9355c03054950231ba8c4a88371a95af&language=en-US&page=1'));
    var all_data = jsonDecode(response.body.toString());
    // print(all_data);
    if (response.statusCode == 200) {
      List<dynamic> results = all_data['results'];
      for (Map<String, dynamic> i in results) {
        MovieModelUpcoming object = MovieModelUpcoming(
            poster_path: i['poster_path'], original_title: i['original_title']);
        movielistupcoming.add(object);
      }
      return movielistupcoming;
    } else {
      return movielistupcoming;
    }
  }

  //letest movies with custom MovieModelLatest
  List<MovieModelLatest> movielistLatest = [];
  Future<List<MovieModelLatest>> latestmovies() async {
    final response = await get(Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=9355c03054950231ba8c4a88371a95af&language=en-US&page=1'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      List<dynamic> results = data['results'];
      for (Map<String, dynamic> i in results) {
        MovieModelLatest object =
            MovieModelLatest(poster_path: i['poster_path'], title: i['title']);
        movielistLatest.add(object);
      }
      return movielistLatest;
    } else {
      return movielistLatest;
    }
  }

  @override
  void initState() {
    super.initState();
    popularMovies();
    // upcomingmovies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //main container for whole app
        color: Colors.black, //background color for the container whole app
        child: Column(children: [
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
                                text: 'Action',
                              ),
                              CategoryCustomWidget(
                                text: 'Popular',
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
          Container(
            // this container is for latest movies
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 25),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular',
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
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: FutureBuilder(
                      future: popularMovies(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: Text('Loading'),
                          );
                        }
                        if (snapshot.hasData) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 140,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "https://image.tmdb.org/t/p/w500" +
                                                  snapshot.data[index]
                                                      ["poster_path"]),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      snapshot.data[index]["title"],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
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
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Latest',
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
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          child: FutureBuilder(
                            future: latestmovies(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              }
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: movielistLatest.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 140,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://image.tmdb.org/t/p/w500" +
                                                        snapshot.data![index]
                                                            .poster_path
                                                            .toString()),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          child: Text(
                                            snapshot.data![index].title
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                );
                              }
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
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
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Up Coming',
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
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          child: FutureBuilder(
                            future: upcomingmovies(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              }
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: movielistupcoming.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 140,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://image.tmdb.org/t/p/w500" +
                                                        snapshot.data![index]
                                                            .poster_path
                                                            .toString()),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          child: Text(
                                            snapshot.data![index].original_title
                                                .toString(),
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                fontSize: 8),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                );
                              }
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
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
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Top Rated',
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
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          child: FutureBuilder(
                            // future: topRatedMovies(),
                            future: topratedmovies(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<MovieModel>> snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              }
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: movielist.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 140,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    // "https://image.tmdb.org/t/p/w500" +
                                                    //     snapshot.data [index]
                                                    //         ["poster_path"]
                                                    "https://image.tmdb.org/t/p/w500" +
                                                        snapshot.data![index]
                                                            .poster_path
                                                            .toString()),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          child: Text(
                                            snapshot.data![index].original_title
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
