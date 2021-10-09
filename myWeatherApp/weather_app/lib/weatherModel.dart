// ignore_for_file: unnecessary_this, unnecessary_new, file_names, deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

String getTimeFromTimestamp(int timestamp) {
  var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var formatter = new DateFormat('h:mm a');
  return formatter.format(date);
}

String getDateFromTimestamp(int timestamp) {
  var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var formatter = new DateFormat('EEEE');
  return formatter.format(date);
}

Widget weatherBox(weatherModel _weather) {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String formatted = formatter.format(now);
  /* return Center(
    child: Card(
      color: Color.fromRGBO(255, 255, 255, 1),
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Text("${_weather.city.name}"),
        getWeatherIcon(
            weatherDesc: _weather.list[0].weather[0].description,
            color: Color.fromRGBO(243, 17, 154, 0.5),
            size: 40),
        Text("Min : ${(_weather.list[0].main.tempMin - 272.5).round()}°C"),
        Text("Max : ${(_weather.list[0].main.tempMax - 272.5).round()}°C"),
        Text("Hum : ${_weather.list[0].main.humidity}%"),
        Row(
          children: <Widget>[
            Card(
              color: Color.fromRGBO(140, 92, 121, 1),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("${_weather.city.name}"),
                  getWeatherIcon(
                      weatherDesc: _weather.list[1].weather[0].main,
                      color: Color.fromRGBO(243, 17, 154, 0.5),
                      size: 40),
                  Text(
                      "Min : ${(_weather.list[1].main.tempMin - 272.5).round()}°C"),
                  Text(
                      "Max : ${(_weather.list[1].main.tempMax - 272.5).round()}°C"),
                  Text("Hum : ${_weather.list[1].main.humidity}%"),
                ],
              ),
            ),
            Card(
              color: Color.fromRGBO(140, 92, 121, 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("${_weather.city.name}"),
                  getWeatherIcon(
                      weatherDesc: _weather.list[2].weather[0].main,
                      color: Color.fromRGBO(243, 17, 154, 0.5),
                      size: 40),
                  Text(
                      "Min : ${(_weather.list[2].main.tempMin - 272.5).round()}°C"),
                  Text(
                      "Max : ${(_weather.list[2].main.tempMax - 272.5).round()}°C"),
                  Text("Hum : ${_weather.list[2].main.humidity}%"),
                ],
              ),
            ),
            Card(
              color: Color.fromRGBO(140, 92, 121, 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("${_weather.city.name}"),
                  getWeatherIcon(
                      weatherDesc: _weather.list[3].weather[0].main,
                      color: Color.fromRGBO(243, 17, 154, 0.5),
                      size: 40),
                  Text(
                      "Min : ${(_weather.list[3].main.tempMin - 272.5).round()}°C"),
                  Text(
                      "Max : ${(_weather.list[3].main.tempMax - 272.5).round()}°C"),
                  Text("Hum : ${_weather.list[3].main.humidity}%"),
                ],
              ),
            ),
            Card(
              color: Color.fromRGBO(140, 92, 121, 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("${_weather.city.name}"),
                  getWeatherIcon(
                      weatherDesc: _weather.list[4].weather[0].main,
                      color: Color.fromRGBO(243, 17, 154, 0.5),
                      size: 40),
                  Text(
                      "Min : ${(_weather.list[4].main.tempMin - 272.5).round()}°C"),
                  Text(
                      "Max : ${(_weather.list[4].main.tempMax - 272.5).round()}°C"),
                  Text("Hum : ${_weather.list[4].main.humidity}%"),
                ],
              ),
            ),
            Card(
              color: Color.fromRGBO(140, 92, 121, 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("${_weather.city.name}"),
                  getWeatherIcon(
                      weatherDesc: _weather.list[5].weather[0].main,
                      color: Color.fromRGBO(243, 17, 154, 0.5),
                      size: 40),
                  Text(formatted),
                  Text(
                      "Min : ${(_weather.list[5].main.tempMin - 272.5).round()}°C"),
                  Text(
                      "Max : ${(_weather.list[5].main.tempMax - 272.5).round()}°C"),
                  Text("Hum : ${_weather.list[5].main.humidity}%"),
                ],
              ),
            ),
          ],
        ),
      ]),
    ),
  );*/

  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(getDateFromTimestamp(_weather.list[0].dt)),
        Text("${_weather.city.name}"),
        getWeatherIcon(
            weatherDesc: _weather.list[0].weather[0].description,
            color: Color.fromRGBO(243, 17, 154, 0.5),
            size: 140),
        Text("Min : ${(_weather.list[0].main.tempMin - 272.5).round()}°C"),
        Text("Max : ${(_weather.list[0].main.tempMax - 272.5).round()}°C"),
        Text("Hum : ${_weather.list[0].main.humidity}%"),
        Expanded(
          //   height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Card(
                color: Color.fromRGBO(140, 92, 121, 1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(getDateFromTimestamp(_weather.list[3].dt)),
                    Text("${_weather.city.name}"),
                    getWeatherIcon(
                        weatherDesc: _weather.list[1].weather[0].main,
                        color: Color.fromRGBO(243, 17, 154, 0.5),
                        size: 40),
                    Text(
                        "Min : ${(_weather.list[1].main.tempMin - 272.5).round()}°C"),
                    Text(
                        "Max : ${(_weather.list[1].main.tempMax - 272.5).round()}°C"),
                    Text("Hum : ${_weather.list[1].main.humidity}%"),
                  ],
                ),
              ),
              Card(
                color: Color.fromRGBO(140, 92, 121, 1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(getDateFromTimestamp(_weather.list[11].dt)),
                    Text("${_weather.city.name}"),
                    getWeatherIcon(
                        weatherDesc: _weather.list[2].weather[0].main,
                        color: Color.fromRGBO(243, 17, 154, 0.5),
                        size: 40),
                    Text(
                        "Min : ${(_weather.list[2].main.tempMin - 272.5).round()}°C"),
                    Text(
                        "Max : ${(_weather.list[2].main.tempMax - 272.5).round()}°C"),
                    Text("Hum : ${_weather.list[2].main.humidity}%"),
                  ],
                ),
              ),
              Card(
                color: Color.fromRGBO(140, 92, 121, 1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(getDateFromTimestamp(_weather.list[17].dt)),
                    Text("${_weather.city.name}"),
                    getWeatherIcon(
                        weatherDesc: _weather.list[3].weather[0].main,
                        color: Color.fromRGBO(243, 17, 154, 0.5),
                        size: 40),
                    Text(
                        "Min : ${(_weather.list[3].main.tempMin - 272.5).round()}°C"),
                    Text(
                        "Max : ${(_weather.list[3].main.tempMax - 272.5).round()}°C"),
                    Text("Hum : ${_weather.list[3].main.humidity}%"),
                  ],
                ),
              ),
              Card(
                color: Color.fromRGBO(140, 92, 121, 1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(getDateFromTimestamp(_weather.list[24].dt)),
                    Text("${_weather.city.name}"),
                    getWeatherIcon(
                        weatherDesc: _weather.list[4].weather[0].main,
                        color: Color.fromRGBO(243, 17, 154, 0.5),
                        size: 40),
                    Text(
                        "Min : ${(_weather.list[4].main.tempMin - 272.5).round()}°C"),
                    Text(
                        "Max : ${(_weather.list[4].main.tempMax - 272.5).round()}°C"),
                    Text("Hum : ${_weather.list[4].main.humidity}%"),
                  ],
                ),
              ),
              Card(
                color: Color.fromRGBO(140, 92, 121, 1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(getDateFromTimestamp(_weather.list[32].dt)),
                    Text("${_weather.city.name}"),
                    getWeatherIcon(
                        weatherDesc: _weather.list[5].weather[0].main,
                        color: Color.fromRGBO(243, 17, 154, 0.5),
                        size: 40),
                    Text(
                        "Min : ${(_weather.list[5].main.tempMin - 272.5).round()}°C"),
                    Text(
                        "Max : ${(_weather.list[5].main.tempMax - 272.5).round()}°C"),
                    Text("Hum : ${_weather.list[5].main.humidity}%"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget getWeatherIcon(
    {required String weatherDesc, required Color color, required double size}) {
  switch (weatherDesc) {
    case "Clear":
      {
        return Icon(
          FontAwesomeIcons.sun,
          color: color,
          size: size,
        );
      }
      break;
    case "Clouds":
      {
        return Icon(
          FontAwesomeIcons.cloud,
          color: color,
          size: size,
        );
      }
      break;
    case "Rain":
      {
        return Icon(
          FontAwesomeIcons.cloudRain,
          color: color,
          size: size,
        );
      }
      break;
    case "Snow":
      {
        return Icon(
          FontAwesomeIcons.snowman,
          color: color,
          size: size,
        );
      }
      break;
    default:
      {
        return Icon(
          FontAwesomeIcons.sun,
          color: color,
          size: size,
        );
      }
      break;
  }
}

class weatherModel {
  String cod = "";
  int message = 0;
  int cnt = 0;
  List<ListM> list = <ListM>[];
  City city = new City(
      id: 0,
      name: "name",
      coord: new Coord(lat: 0, lon: 0),
      country: "country",
      population: 0,
      timezone: 0,
      sunrise: 0,
      sunset: 0);

  weatherModel(
      {required this.cod,
      required this.message,
      required this.cnt,
      required this.list,
      required this.city});

  weatherModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <ListM>[];
      json['list'].forEach((v) {
        list.add(new ListM.fromJson(v));
      });
    }
    city = (json['city'] != null ? new City.fromJson(json['city']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cod'] = this.cod;
    data['message'] = this.message;
    data['cnt'] = this.cnt;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    return data;
  }
}

class ListM {
  int dt = 0;
  Main main = new Main(
      temp: 0,
      feelsLike: 0,
      tempMin: 0,
      tempMax: 0,
      pressure: 0,
      seaLevel: 0,
      grndLevel: 0,
      humidity: 0,
      tempKf: 0);
  List<Weather> weather = <Weather>[];
  Clouds clouds = new Clouds(all: 0);
  Wind wind = new Wind(speed: 0, deg: 0, gust: 0);
  int visibility = 0;
  int pop = 0;
  Sys sys = new Sys(pod: "pod");
  String dtTxt = "";

  ListM(
      {required this.dt,
      required this.main,
      required this.weather,
      required this.clouds,
      required this.wind,
      required this.visibility,
      required this.pop,
      required this.sys,
      required this.dtTxt});

  ListM.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = (json['main'] != null ? new Main.fromJson(json['main']) : null)!;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    clouds =
        (json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null)!;
    wind = (json['wind'] != null ? new Wind.fromJson(json['wind']) : null)!;
    visibility = json['visibility'];
    pop = json['pop'];
    sys = (json['sys'] != null ? new Sys.fromJson(json['sys']) : null)!;
    dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    if (this.main != null) {
      data['main'] = this.main.toJson();
    }
    if (this.weather != null) {
      data['weather'] = this.weather.map((v) => v.toJson()).toList();
    }
    if (this.clouds != null) {
      data['clouds'] = this.clouds.toJson();
    }
    if (this.wind != null) {
      data['wind'] = this.wind.toJson();
    }
    data['visibility'] = this.visibility;
    data['pop'] = this.pop;
    if (this.sys != null) {
      data['sys'] = this.sys.toJson();
    }
    data['dt_txt'] = this.dtTxt;
    return data;
  }
}

class Main {
  double temp = 0;
  double feelsLike = 0;
  double tempMin = 0;
  double tempMax = 0;
  int pressure = 0;
  int seaLevel = 0;
  int grndLevel = 0;
  int humidity = 0;
  double tempKf = 0;

  Main(
      {required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.seaLevel,
      required this.grndLevel,
      required this.humidity,
      required this.tempKf});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
    humidity = json['humidity'];
    tempKf = json['temp_kf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['feels_like'] = this.feelsLike;
    data['temp_min'] = this.tempMin;
    data['temp_max'] = this.tempMax;
    data['pressure'] = this.pressure;
    data['sea_level'] = this.seaLevel;
    data['grnd_level'] = this.grndLevel;
    data['humidity'] = this.humidity;
    data['temp_kf'] = this.tempKf;
    return data;
  }
}

class Weather {
  int id = 0;
  String main = "";
  String description = "";
  String icon = "";

  Weather(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}

class Clouds {
  int all = 0;

  Clouds({required this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all'] = this.all;
    return data;
  }
}

class Wind {
  double speed = 0;
  int deg = 0;
  double gust = 0;

  Wind({required this.speed, required this.deg, required this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    data['gust'] = this.gust;
    return data;
  }
}

class Sys {
  String pod = "";

  Sys({required this.pod});

  Sys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pod'] = this.pod;
    return data;
  }
}

class City {
  int id = 0;
  String name = "";
  Coord coord = new Coord(lat: 0, lon: 0);
  String country = "";
  int population = 0;
  int timezone = 0;
  int sunrise = 0;
  int sunset = 0;

  City(
      {required this.id,
      required this.name,
      required this.coord,
      required this.country,
      required this.population,
      required this.timezone,
      required this.sunrise,
      required this.sunset});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = (json['coord'] != null ? new Coord.fromJson(json['coord']) : null)!;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.coord != null) {
      data['coord'] = this.coord.toJson();
    }
    data['country'] = this.country;
    data['population'] = this.population;
    data['timezone'] = this.timezone;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    return data;
  }
}

class Coord {
  double lat = 0;
  double lon = 0;

  Coord({required this.lat, required this.lon});

  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}
