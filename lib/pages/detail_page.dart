import 'package:cozy_home/pages/error_page.dart';
import 'package:cozy_home/theme.dart';
import 'package:cozy_home/widgets/facility_item.dart';
import 'package:cozy_home/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../models/space.dart';

class DetailPage extends StatelessWidget {
  Space space;
  DetailPage({required this.space});

  @override
  Widget build(BuildContext context) {
    urlLaunch(String url) async {
      if (await canLaunchUrlString(url)) {
        launchUrlString(url);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ErrorPage(),
          ),
        );
      }
    }

    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Image.network(
                space.imageUrl.toString(),
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.cover,
              ),
              ListView(
                children: [
                  const SizedBox(
                    height: 328,
                  ),
                  Container(
                    // height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        color: whiteColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    space.name.toString(),
                                    style: blackTextStyle.copyWith(
                                      fontSize: 22,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text.rich(TextSpan(
                                      text: "\$${space.price}",
                                      style: purpleTextStyle.copyWith(
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: ' / Month',
                                            style: grayTextStyle.copyWith(
                                                fontSize: 16)),
                                      ])),
                                ],
                              ),
                              Row(
                                children: [1, 2, 3, 4, 5].map((e) {
                                  return RatingItem(
                                      index: e, rating: space.rating);
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Text(
                            "Main Facilities",
                            style: blackTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FacilyItem(
                                  name: "Kitchen",
                                  imageUrl: "assets/icon_kitchen.png",
                                  total: space.numberOfKitchens),
                              FacilyItem(
                                  name: "Bedroom",
                                  imageUrl: "assets/icon_bedroom.png",
                                  total: space.numberOfBedrooms),
                              FacilyItem(
                                  name: "Cupboard",
                                  imageUrl: "assets/icon_cupboard.png",
                                  total: space.numberOfCupboards),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Text(
                            "Photos",
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 88,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(left: edge),
                            children: space.photos.map((item) {
                              return Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    item.toString(),
                                    width: 110,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Text(
                            "Location",
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    (20 /
                                        100 *
                                        MediaQuery.of(context).size.width),
                                child: Text(
                                  space.address.toString(),
                                  style: grayTextStyle.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => urlLaunch(space.mapUrl.toString()),
                                child: Image.asset(
                                  "assets/btn_map.png",
                                  width: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: edge),
                            width:
                                MediaQuery.of(context).size.width - (2 * edge),
                            height: 50,
                            child: RaisedButton(
                              onPressed: () {
                                urlLaunch("tel:${space.phone}");
                              },
                              color: purpleColor,
                              textColor: whiteColor,
                              child: Text("Book now"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        "assets/btn_back.png",
                        width: 40,
                      ),
                    ),
                    Image.asset(
                      "assets/btn_wishlist.png",
                      width: 40,
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
