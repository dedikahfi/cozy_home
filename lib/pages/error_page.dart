import 'package:cozy_home/pages/home_page.dart';
import 'package:cozy_home/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/error.png",
              width: 300,
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              "Where are you going?",
              style: blackTextStyle.copyWith(fontSize: 24),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              textAlign: TextAlign.center,
              "Seems like the page that you were \nrequested is already gone",
              style: grayTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width - (2 * edge),
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (route) => false);
                },
                color: purpleColor,
                child: Text(
                  "Back to Home",
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
