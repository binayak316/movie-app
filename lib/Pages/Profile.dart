import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void signOutAndNavigateToLogin(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(
        context, '/'); // Replace '/login' with your login page route
  }

  late final Query<Map<String, dynamic>> _userStream;

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;
    _userStream = FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: _auth.currentUser!.email)
        .get() as Query<Map<String, dynamic>>;
    final user = _auth.currentUser;
    double height = 500.0;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('ProfileScreen'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              signOutAndNavigateToLogin(context);
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              shape: CircleBorder(),
            ),
            icon: Icon(
              Icons.logout,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(children: [
        Builder(builder: (context) {
          final List storedocs = [];
          // _userStream.data!.docs.map((DocumentSnapshot document) {
          //   Map a = document.data()! as Map<String, dynamic>;
          //   storedocs.add(a);

          //   a['id'] = document.id;
          // }).toList();
          // final userData = snapshot.data!.data() as Map<String, dynamic>;

          // final String firstName = _userStr
          final String lastName = storedocs[0]['last name'];
          final String phoneNumber = storedocs[0]['phone number'].toString();
          return Column(
            children: [
              Container(
                child: Image.asset(
                  'assets/images.png',
                  fit: BoxFit.contain,
                ),
              ),
              // Text(
              //   '$firstName $lastName',
              //   style: TextStyle(color: Colors.red),
              // ),
              Text(
                'Binayakkkkk',
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                user?.email ?? '',
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                phoneNumber,
                style: TextStyle(color: Colors.white),
              ),
            ],
          );
        }),
      ]),
      // StreamBuilder<QuerySnapshot>(
      //   stream: _userStream,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       final List storedocs = [];
      //       snapshot.data!.docs.map((DocumentSnapshot document) {
      //         Map a = document.data()! as Map<String, dynamic>;
      //         storedocs.add(a);

      //         a['id'] = document.id;
      //       }).toList();
      //       // final userData = snapshot.data!.data() as Map<String, dynamic>;

      //       final String firstName = storedocs[0]['first name'];
      //       final String lastName = storedocs[0]['last name'];
      //       final String phoneNumber =
      //           storedocs[0]['phone number'].toString();

      //       return Column(
      //         children: [
      //           Container(
      //             child: Image.asset(
      //               'assets/images.png',
      //               fit: BoxFit.contain,
      //             ),
      //           ),
      //           Text(
      //             '$firstName $lastName',
      //             style: TextStyle(color: Colors.red),
      //           ),
      //           Text(
      //             'Binayakkkkk',
      //             style: TextStyle(color: Colors.red),
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Text(
      //             user?.email ?? '',
      //             style: TextStyle(color: Colors.red),
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Text(
      //             phoneNumber,
      //             style: TextStyle(color: Colors.white),
      //           ),
      //         ],
      //       );
      // } else {
      //   return Text('User details not found');
      // }
      // },
      //     )
      //   ],
      // ),
    );
  }
}
