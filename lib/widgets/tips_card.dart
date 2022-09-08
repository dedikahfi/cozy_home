import 'package:cozy_home/theme.dart';
import 'package:flutter/material.dart';
import 'package:cozy_home/models/tips.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;
  // ignore: use_key_in_widget_constructors
  const TipsCard({required this.tips});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: edge),
      child: Row(
        children: [
          Image.asset(
            tips.imageUrl,
            width: 80,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tips.title,
                style: blackTextStyle,
              ),
              Text(
                "Updated ${tips.updatedAt}",
                style: grayTextStyle.copyWith(fontSize: 14),
              )
            ],
          ),
          Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chevron_right,
                size: 24,
              ))
        ],
      ),
    );
  }
}
