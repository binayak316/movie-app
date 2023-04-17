// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';

// class MovieModel {
//   String? movie_id;
//   String? data;

//   MovieModel({required this.movie_id});

//   Future<void> fetchMovies() async {
//     // var url;
//     Response response = await get(Uri.parse(
//         "https://api.themoviedb.org/3/movie/$movie_id?api_key=9355c03054950231ba8c4a88371a95af&language=en-US"));
//     if (response.statusCode == 200) {
//       Map data = jsonDecode(response.body);
//       List<dynamic> temp_data = data['results'];
//       print(temp_data);
//     } else {
//       throw Exception('Error of data loading');
//     }
//   }
// }
