// ignore_for_file: prefer_const_constructors, deprecated_member_use, curly_braces_in_flow_control_structures

import 'dart:convert';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Network.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_app/weatherModel.dart';
import 'weatherBloc.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => WeatherBloc(Network()),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (_, theme) {
            return MaterialApp(
              home: Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: SearchPage(),
                  ),
                ),
              ),
            );
          },
        ));
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    var cityController = TextEditingController();

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherIsNotSearched)
          return Container(
            padding: EdgeInsets.only(
              left: 32,
              right: 32,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  "Votre météo",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Text(
                  "en temps réel",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w200,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: cityController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Colors.black, style: BorderStyle.solid)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Colors.blue, style: BorderStyle.solid)),
                    hintText: "Nom de la ville",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    onPressed: () {
                      weatherBloc.add(FetchWeather(cityController.text));
                    },
                    color: Colors.lightBlue,
                    child: Text(
                      "Recherche",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          );
        else if (state is WeatherIsLoading)
          return Center(child: CircularProgressIndicator());
        else if (state is WeatherIsLoaded)
          return ShowWeather(state.getWeather, cityController.text);
        else
          return Text(
            "Error",
            style: TextStyle(color: Colors.white),
          );
      },
    );
  }
}

class ShowWeather extends StatelessWidget {
  weatherModel weather;
  Network net = Network();
  final city;

  ShowWeather(this.weather, this.city, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            this.weather = snapshot.data as weatherModel;
            if (this.weather == null) {
              return Text("Error getting weather");
            } else {
              return weatherBox(weather);
            }
          } else {
            return CircularProgressIndicator();
          }
        },
        future: net.getWeather(city: weather.city.name),
      ),
    );
  }
}
