import 'package:flutter/material.dart';
import 'package:cozy_home/theme.dart';
import 'package:cozy_home/models/space.dart';

class SpaceCard extends StatelessWidget {
  Space space;
  SpaceCard({required this.space});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  Image.asset(space.imageUrl),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 30,
                      width: 70,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30)),
                          color: purpleColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icon_star.png",
                            width: 15,
                          ),
                          Text(
                            "${space.rating}/5",
                            style: whiteTextStyle.copyWith(fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              space.name,
              style: blackTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            Text.rich(TextSpan(
                text: "\$${space.price}",
                style: purpleTextStyle.copyWith(fontSize: 16),
                children: [
                  TextSpan(
                      text: '/ Month',
                      style: grayTextStyle.copyWith(fontSize: 16)),
                ])),
            SizedBox(
              height: 16,
            ),
            Text(
              "${space.city}, ${space.country}",
              style: grayTextStyle.copyWith(fontSize: 14),
            )
          ],
        )
      ],
    );
  }
}
