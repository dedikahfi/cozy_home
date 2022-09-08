import 'package:cozy_home/theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FacilyItem extends StatelessWidget {
  String name;
  String imageUrl;
  int total;

  // ignore: use_key_in_widget_constructors
  FacilyItem({required this.name, required this.imageUrl, required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        const SizedBox(
          height: 2,
        ),
        Text.rich(
          TextSpan(
              text: total.toString(),
              style: purpleTextStyle.copyWith(
                fontSize: 14,
              ),
              children: [
                TextSpan(
                  text: " ${name}",
                  style: grayTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ]),
        ),
      ],
    );
  }
}
