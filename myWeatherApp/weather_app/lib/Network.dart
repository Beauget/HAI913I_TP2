// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart';

import 'weatherModel.dart';

class Network {
  Future<weatherModel> getWeather({required String city}) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast?q=" +
        city +
        "&appid=547502b05916878a5d0c514b504fb68c";

    final response = await get(Uri.parse(finalUrl));
      print("URL :  ${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      return weatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("problème getData ");
    }
  }
}
