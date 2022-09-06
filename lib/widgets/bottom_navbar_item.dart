import 'package:cozy_home/theme.dart';
import 'package:flutter/material.dart';

class BottomNavbarItem extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  BottomNavbarItem({required this.imageUrl, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
        ),
        Spacer(),
        isActive
            ? Container(
                height: 2,
                width: 30,
                decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius: BorderRadius.circular(1000)),
              )
            : Container(),
      ],
    );
  }
}
