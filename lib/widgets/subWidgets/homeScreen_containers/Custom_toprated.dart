import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/Model/MainMovieModel.dart';
import 'package:movie_app/Model/MovieModel.dart';
import 'package:movie_app/Model/MovieModelLatest.dart';
import 'package:movie_app/Model/MovieModelUpcoming.dart';
import 'package:movie_app/Model/popularModel.dart';
import 'package:http/http.dart';
import 'dart:convert';

class CustomTopRated extends StatefulWidget {
  const CustomTopRated({super.key});

  @override
  State<CustomTopRated> createState() => _CustomTopRatedState();
}

class _CustomTopRatedState extends State<CustomTopRated> {
  List<MainMovieModel> movielist = [];
  Future<List<MainMovieModel>?> topratedmovies() async {
    final response = await get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=9355c03054950231ba8c4a88371a95af&language=en-US&page=1'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      List<dynamic> results = data['results'];
      movielist = results
          .map<MainMovieModel>((e) => MainMovieModel.fromJson(e))
          .toList();
      setState(() {});
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
          Container(
            height: 200,
            width: double.infinity,
            child: FutureBuilder(
              future: topratedmovies(),
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
                            child: Container(
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500" +
                                          movielist[index]
                                              .posterPath
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
          )
        ],
      ),
    );
  }
}
