import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/Model/MainMovieModel.dart';
import 'package:movie_app/Model/popularModel.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:movie_app/Pages/PlayMovie.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CustomPopular extends StatefulWidget {
  // final int id;
  // CustomPopular({required this.id});
  const CustomPopular({Key? key}) : super(key: key);

  @override
  State<CustomPopular> createState() => _CustomPopularState();
}

class _CustomPopularState extends State<CustomPopular> {
  CollectionReference movies = FirebaseFirestore.instance.collection('movies');

  bool click = true;

  List<MainMovieModel> movielist = [];
  Future<List<MainMovieModel>?> popularMovies() async {
    final response = await get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=9355c03054950231ba8c4a88371a95af&language=en-US&page=1'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      List<dynamic> results = data['results'];
      movielist = results
          .map<MainMovieModel>((e) => MainMovieModel.fromJson(e))
          .toList();
      if (this.mounted) {
        setState(() {});
      }

      return movielist;
    } else {
      print(response.statusCode);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
            height: 200,
            width: double.infinity,
            child: FutureBuilder(
              future: popularMovies(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movielist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                // addData();
                                await movies
                                    .add({
                                      "id": movielist[index].id.toString(),
                                      "image": movielist[index]
                                          .posterPath
                                          .toString(),
                                      "title":
                                          movielist[index].title.toString(),
                                    })
                                    .then((value) => print("User Added"))
                                    .catchError((error) =>
                                        print("Failed to add user: $error"));

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PlayMovie(
                                      imageOfMovie:
                                          "https://image.tmdb.org/t/p/w500" +
                                              movielist[index]
                                                  .posterPath
                                                  .toString(),
                                      titleOfMovie: movielist[index]
                                          .originalTitle
                                          .toString(),
                                      descriptionOfMovie:
                                          movielist[index].overview.toString(),
                                      vote_average: movielist[index]
                                          .voteAverage
                                          .toString(),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      "https://image.tmdb.org/t/p/w500" +
                                          movielist[index]
                                              .posterPath
                                              .toString(),
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                    ),
                                    Positioned(
                                      top: 2,
                                      right: 12,
                                      child: GestureDetector(
                                        onTap: () {
                                          // addData();

                                          setState(() {
                                            click = !click;
                                          });

                                          print('favourite icon is clicked');
                                        },
                                        child: Icon(
                                          (click == false)
                                              ? Icons.favorite_outline
                                              : Icons.favorite_rounded,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Text(
                              movielist[index].title.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 8),
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
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
