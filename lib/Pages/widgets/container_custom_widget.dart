import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ContainerCustomWidget extends StatelessWidget {
  const ContainerCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: NetworkImage(
                'https://cdn.cinematerial.com/p/297x/nza9lluu/top-gun-maverick-movie-poster-md.jpg?v=1648561333'),
            fit: BoxFit.cover),
      ),
    );
  }
}
