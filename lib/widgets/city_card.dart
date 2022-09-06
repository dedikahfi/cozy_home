import 'package:cozy_home/theme.dart';
import 'package:flutter/material.dart';
import 'package:cozy_home/models/city.dart';

class CityCard extends StatelessWidget {
  City city;
  CityCard({required this.city});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.imageUrl,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                city.isPopuler
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 30,
                          width: 50,
                          child: Center(
                              child: Image.asset(
                            "assets/icon_star.png",
                            width: 20,
                          )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(36)),
                              color: purpleColor),
                        ),
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              city.name,
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
