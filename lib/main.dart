import 'package:flutter/material.dart';
import 'package:movie_app/Pages/home.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, routes: {
    "/": (context) => HomeScreen(),
  }));
}
