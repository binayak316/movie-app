// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:movie_app/widgets/subWidgets/container_custom_widget.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';



// //this is a custom widget which holds an entire container and holds prefix suffix text along with another
// // custom widget which is ContainerCustomWidget for dynamic image
// class CustomCategorywiseWidget extends StatelessWidget {
//   final String preText;
//   final String sufText;
//   final String NewtworkImage;

//   const CustomCategorywiseWidget({
//     required this.preText,
//     required this.sufText,
//     required this.NewtworkImage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // this container is for latest movies
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 15, right: 25),
//             child: Container(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     preText,
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500),
//                   ),
//                   Text(
//                     sufText,
//                     style: TextStyle(
//                         color: Colors.orange,
//                         fontSize: 10,
//                         fontWeight: FontWeight.w500),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 15, right: 15),
//             child: Container(
//               height: 200,
//               width: double.infinity,
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 10,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         width: 140,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           image: DecorationImage(
//                             image: NetworkImage(NewtworkImage),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
