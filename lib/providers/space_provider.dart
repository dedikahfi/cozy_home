import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cozy_home/models/space.dart';

class SpaceProvider extends ChangeNotifier {
  getRecommendedSpaces() async {
    var url = Uri.https('bwa-cozy.herokuapp.com', 'recommended-spaces');
    var result = await http.get(url);

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((e) => Space.fromJson(e)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
