import 'package:cozy_home/providers/space_provider.dart';
import 'package:cozy_home/widgets/bottom_navbar_item.dart';
import 'package:cozy_home/widgets/city_card.dart';
import 'package:cozy_home/widgets/space_card.dart';
import 'package:cozy_home/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:cozy_home/theme.dart';
import 'package:cozy_home/models/city.dart';
import 'package:cozy_home/models/space.dart';
import 'package:cozy_home/models/tips.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            // NOTE: HEADER/TITLE
            SizedBox(
              height: edge,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                "Explore Now",
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Mencari tempat yang cozy',
                style: grayTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // NOTE: POPULER CITIES
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Popular Cities",
                style: reqularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                      city: City(
                          id: 1,
                          name: "Jakarta",
                          imageUrl: "assets/city1.png")),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    city: City(
                        id: 2,
                        name: "Bandung",
                        imageUrl: "assets/city2.png",
                        isPopuler: true),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                      city: City(
                          id: 3,
                          name: "Palembang",
                          imageUrl: "assets/city4.png")),
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                      city: City(
                          id: 4, name: "Aceh", imageUrl: "assets/city5.png")),
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                      city: City(
                          id: 5,
                          name: "Bogor",
                          imageUrl: "assets/city6.png",
                          isPopuler: true)),
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                      city: City(
                          id: 6,
                          name: "Surabaya",
                          imageUrl: "assets/city3.png")),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: RECOMENDED SPACE
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                "Recomended Space",
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data as List<Space>;
                    var index = 0;

                    return Column(
                      children: data.map((item) {
                        index++;

                        return Container(
                            margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                            child: SpaceCard(space: item));
                      }).toList(),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            // NOTE: TIPS & GUIDANCE
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 30),
              child: Text(
                "Tips & Guidance",
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              children: [
                TipsCard(
                    tips: Tips(
                        id: 1,
                        title: "City Guidelines",
                        updatedAt: "20 Apr",
                        imageUrl: "assets/tips1.png")),
                SizedBox(
                  height: 20,
                ),
                TipsCard(
                    tips: Tips(
                        id: 2,
                        title: "Jakarta Fairship",
                        updatedAt: "11 Dec",
                        imageUrl: "assets/tips2.png")),
              ],
            ),
            SizedBox(
              height: 50 + (2 * edge),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: "assets/icon_home.png",
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: "assets/icon_email.png",
            ),
            BottomNavbarItem(
              imageUrl: "assets/icon_card.png",
            ),
            BottomNavbarItem(
              imageUrl: "assets/icon_love.png",
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: const Color(0xffF6F7F8),
            borderRadius: BorderRadius.circular(23)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
