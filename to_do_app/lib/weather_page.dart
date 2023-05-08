import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:to_do_app/Models/weather_input_classes.dart';
import 'package:to_do_app/Widgets/drawer_menu.dart';
import 'package:http/http.dart' as http;

import 'Utils/color_themes.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherRoot? weather;

  final weatherInputController = TextEditingController();

  String? weatherCity;

  String errorText = 'Ingen by indtastet';

  void getWeatherAtCity() async {
    weatherCity = weatherInputController.text;
    if (weatherCity != "" && weatherCity != null) {
      var response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=${weatherCity}&lang=da&units=metric&appid=5e6bae6ab65c1062a636855973e4545e"));
      if (response.statusCode != 404) {
        weather = WeatherRoot.fromJson(jsonDecode(response.body));
      } else {
        errorText = 'Kunne ikke hente vejret';
      }
    } else {
      errorText = 'Ingen by indtastet';
    }
    setState(() {});
  }

  getWeatherAtLocation() async {
    var position = await getPosition();
    var response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&lang=da&units=metric&appid=5e6bae6ab65c1062a636855973e4545e"));
    if (response.statusCode != 404) {
      weather = WeatherRoot.fromJson(jsonDecode(response.body));
    } else {
      errorText = 'Kunne ikke hente vejret';
    }
    setState(() {
    });
  }

  Future<Position> getPosition() async{
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    getWeatherAtLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: getWeatherAtCity, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: weatherInputController,
                        maxLines: 1,
                        decoration:
                            const InputDecoration(hintText: "Indtast by"),
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    IconButton(
                      onPressed: getWeatherAtCity,
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            ThemeColors.appBarColor),
                      ),
                    ),
                  ],
                ),
                // if (weatherCity == "" || weatherCity == null) ...[
                //   Text(errorText),
                // ]
                if (weather != null) ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      weather!.name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                      ],
                    ),
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
