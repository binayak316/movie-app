import 'package:flutter/material.dart';
import 'package:movie_app/Pages/home.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Pages/auth/login.dart';
// void main() {
//   runApp(MaterialApp(debugShowCheckedModeBanner: false, routes: {
//     "/": (context) => HomeScreen(),
//   }));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // add this line
  await Firebase.initializeApp();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, routes: {
    "/": (context) => MyLogin(),
  }));
}
