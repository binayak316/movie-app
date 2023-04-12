import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/Pages/widgets/subWidgets/container_custom_widget.dart';

//this is a custom widget which holds an entire container and holds prefix suffix text along with another
// custom widget which is ContainerCustomWidget for dynamic image
class CustomCategorywiseWidget extends StatelessWidget {
  final String preText;
  final String sufText;
  const CustomCategorywiseWidget(
      {required this.preText, required this.sufText});

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
                    preText,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    sufText,
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
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: 200,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ContainerCustomWidget(
                    NewtworkImage:
                        'https://m.media-amazon.com/images/I/61lla1CLIPL._AC_UL400_.jpg',
                  ),
                  ContainerCustomWidget(
                    NewtworkImage:
                        'https://m.media-amazon.com/images/I/61lla1CLIPL._AC_UL400_.jpg',
                  ),
                  ContainerCustomWidget(
                    NewtworkImage:
                        'https://m.media-amazon.com/images/I/61lla1CLIPL._AC_UL400_.jpg',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
