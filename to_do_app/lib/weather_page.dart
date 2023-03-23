import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:to_do_app/Models/weather_input_classes.dart';
import 'package:to_do_app/Widgets/drawer_menu.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherRoot? weather;

  void getWeather() async {
    var response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=Odense&lang=da&units=metric&appid=5e6bae6ab65c1062a636855973e4545e"));
    weather = WeatherRoot.fromJson(jsonDecode(response.body));
    setState(() {
    });
  }

  @override
  void initState() {
    getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: getWeather, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (weather != null) ...[
                  Image.network(
                    "https://openweathermap.org/img/wn/${weather!.weather[0].icon}@2x.png",
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (weather != null) ...[
                        Text(
                          "${weather!.main.temp.round()} °C",
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "Føles som: ${weather!.main.feelsLike.round()} °C",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text("Vejr: ${weather!.weather[0].description}"),
                      ]
                    ],
                  ),
                ] else ...[
                  Text("Loading..."),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
