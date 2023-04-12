// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:movie_app/Pages/PlayMovie.dart';
// import 'package:movie_app/Pages/mainHomeScreen.dart';

// class BottomNavigationWidget extends StatefulWidget {
//   const BottomNavigationWidget({super.key});

//   @override
//   State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
// }

// class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
//   List Pages = [
//     MainHomeScreenWidget(),
//     // Bookmark(),
//     // Download(),
//     // Profile(),
//   ];
//   int _currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.black,
//       child: ClipRRect(
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30), topRight: Radius.circular(30)),
//         child: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           onTap: (index) {
//             setState(() {
//               _currentIndex = index;
//             });
//           },

//           // selectedItemColor: Colors.white,
//           selectedFontSize: 10,
//           unselectedFontSize: 8,
//           items: [
//             BottomNavigationBarItem(
//               backgroundColor: Colors.black,
//               icon: Icon(
//                 Icons.home,
//                 // color: Colors.white,
//               ),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               backgroundColor: Colors.black,
//               icon: Icon(
//                 Icons.play_circle_fill_rounded,
//                 // color: Colors.white,
//               ),
//               label: 'Watch',
//             ),
//             BottomNavigationBarItem(
//               backgroundColor: Colors.black,
//               icon: Icon(
//                 Icons.bookmark,
//                 // color: Colors.white,
//               ),
//               label: 'Bookmarks',
//             ),
//             BottomNavigationBarItem(
//               backgroundColor: Colors.black,
//               icon: Icon(
//                 Icons.person,
//                 // color: Colors.white,
//               ),
//               label: 'Profile',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
