import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/widgets/categoriesWIdget.dart';

class PlayMovie extends StatelessWidget {
  String? imageOfMovie;
  String? descriptionOfMovie;
  String? titleOfMovie;
  String? vote_average;
  PlayMovie(
      {this.imageOfMovie,
      this.descriptionOfMovie,
      this.titleOfMovie,
      this.vote_average});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.black,
            child: Container(
              height: 430,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageOfMovie.toString()),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),

            //container for upper part for movie screen
          ),
          Container(
            //container for lower part
            color: Colors.black,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    //a row container
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'IMDB  ' + vote_average.toString(),
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_circle_fill,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Play',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      titleOfMovie.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CategoryCustomWidget(
                        onpress: null,
                        text: 'Action',
                      ),
                      CategoryCustomWidget(
                        onpress: null,
                        text: 'Comedy',
                      ),
                      CategoryCustomWidget(
                        onpress: null,
                        text: 'Superhero',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Text(
                    descriptionOfMovie.toString(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 11, fontFamily: 'Times', color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
