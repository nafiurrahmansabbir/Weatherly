import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherly/ui/utilities/app_colors.dart';
import '../data/model/weather_model.dart';
import '../data/service/services.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late WeatherData weather;
  bool isLoading = false;
  String lat='';
  String lon='';

  getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print('Denied');
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      Position currentposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      print(
        'Latiture ${currentposition.latitude.toString()} Longitute ${currentposition.longitude.toString()}',
      );
      lat=currentposition.latitude.toString();
      lon=currentposition.longitude.toString();
    }
    myWeather();
  }

  myWeather() {
    isLoading = false;
    WeatherServices().fetchWeather(lat,lon).then((value) {
      setState(() {
        weather = value;
        isLoading = true;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    weather = WeatherData(
      name: '',
      temperature: Temperature(current: 0.0),
      humidity: 0,
      wind: Wind(speed: 0.0),
      maxTemperature: 0,
      minTemperature: 0,
      pressure: 0,

      weather: [],
      seaLevel: 0,
    );
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat(
      'EEEE d, MMMM yyyy',
    ).format(DateTime.now());
    String formattedTime = DateFormat('hh:mm a').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: Text('Weatherly'),
        actions: [IconButton(onPressed: () {

          getCurrentLocation();
        }, icon: Icon(Icons.my_location))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,

                decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(formattedDate, style: TextStyle(fontSize: 22)),
                      Text(formattedTime, style: TextStyle(fontSize: 18)),
                      Text(weather.name, style: TextStyle(fontSize: 25)),
                      SizedBox(),
                      Center(
                        child: Text(
                          "${weather.temperature.current.toStringAsFixed(2)}°C",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      if (weather.weather.isNotEmpty)
                        Center(
                          child: Text(
                            weather.weather[0].main,
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.wind_power, color: Colors.green),
                              const SizedBox(height: 5),
                              weatherInfoCard(
                                title: "Wind",
                                value: "${weather.wind.speed}km/h",
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.sunny, color: Colors.orange),
                              const SizedBox(height: 5),
                              weatherInfoCard(
                                title: "Max",
                                value:
                                    "${weather.maxTemperature.toStringAsFixed(2)}°C",
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.wind_power, color: Colors.green),
                              const SizedBox(height: 5),
                              weatherInfoCard(
                                title: "Min",
                                value:
                                    "${weather.minTemperature.toStringAsFixed(2)}°C",
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.water_drop,
                                color: Colors.blueAccent,
                              ),
                              const SizedBox(height: 5),
                              weatherInfoCard(
                                title: "Humidity",
                                value: "${weather.humidity}%",
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.air, color: Colors.indigoAccent),
                              const SizedBox(height: 5),
                              weatherInfoCard(
                                title: "Pressure",
                                value: "${weather.pressure}hPa",
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.leaderboard, color: Colors.blue),
                              const SizedBox(height: 5),
                              weatherInfoCard(
                                title: "Sea-Level",
                                value: "${weather.seaLevel}m",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget weatherInfoCard({required String title, required String value}) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ],
    );
  }
}
