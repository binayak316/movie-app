import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ContainerCustomWidget extends StatelessWidget {
  final String NewtworkImage;
  const ContainerCustomWidget({required this.NewtworkImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7),
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(NewtworkImage as String), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
