import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/Model/MainMovieModel.dart';
import 'package:movie_app/Model/MovieModelLatest.dart';
import 'package:movie_app/Model/popularModel.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:movie_app/Pages/PlayMovie.dart';

class CustomLatest extends StatefulWidget {
  const CustomLatest({super.key});

  @override
  State<CustomLatest> createState() => _CustomLatestState();
}

class _CustomLatestState extends State<CustomLatest> {
  // String? movie_image;
  // String? movie_title;
  // String? movie_description;

  List<MainMovieModel> movielist = [];
  Future<List<MainMovieModel>?> latestmovies() async {
    try {
      final response = await get(Uri.parse(
          'https://api.themoviedb.org/3/movie/now_playing?api_key=9355c03054950231ba8c4a88371a95af&language=en-US&page=1'));
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
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    latestmovies();
    // TODO: implement initState
    super.initState();
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
          Container(
            height: 200,
            width: double.infinity,
            child: FutureBuilder(
              future: latestmovies(),
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
                              onTap: () {
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
                                // print('Helo');
                              },
                              child: Stack(
                                children: [
                                  Container(
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
                                  Positioned(
                                    top: 2,
                                    right: 10,
                                    child: GestureDetector(
                                      onTap: () {
                                        print('favourite icon is clicked');
                                      },
                                      child: Icon(
                                        Icons.favorite_rounded,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                      
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
                            child: Text(
                              movielist[index].originalTitle.toString(),
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











// ListViewBuilder without the futurebuilder only with builder
// Container(
//             height: 200,
//             width: double.infinity,
//             child: Builder(builder: (context) {
//               if (movielist.isEmpty) {
//                 return CircularProgressIndicator();
//               } else {
//                 return ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: movielist.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Column(
//                       children: [
//                         Expanded(
//                           child: Container(
//                             width: 140,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               image: DecorationImage(
//                                 image: NetworkImage(
//                                     "https://image.tmdb.org/t/p/w500" +
//                                         movielist[index].posterPath.toString()),
//                                 fit: BoxFit.fitHeight,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Container(
//                           child: Text(
//                             movielist[index].title.toString(),
//                             style: TextStyle(color: Colors.white, fontSize: 8),
//                           ),
//                         )
//                       ],
//                     );
//                   },
//                 );
//               }
//             }),
//           ),
