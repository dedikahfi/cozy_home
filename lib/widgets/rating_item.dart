import 'package:cozy_home/theme.dart';
import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  int index;
  int? rating;
  RatingItem({required this.index, this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: index <= rating!
          ? Image.asset(
              "assets/icon_star.png",
              width: 20,
            )
          : Image.asset(
              "assets/icon_star.png",
              width: 20,
              color: grayColor,
            ),
    );
  }
}
