import 'package:flutter/material.dart';

import '../data/model/weather_model.dart';
import '../utilities/app_colors.dart';

class WeatherDetailsInfoCard extends StatefulWidget {
  final WeatherData weather;

  const WeatherDetailsInfoCard({super.key, required this.weather});

  @override
  State<WeatherDetailsInfoCard> createState() => _WeatherDetailsInfoCardState();
}

class _WeatherDetailsInfoCardState extends State<WeatherDetailsInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(AppColors.cardOpacity),
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
                      value: "${widget.weather.wind.speed} km/h",
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
                      value: "${widget.weather.maxTemperature.toStringAsFixed(2)} °C",
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
                      value: "${widget.weather.minTemperature.toStringAsFixed(2)} °C",
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
                    const Icon(Icons.water_drop, color: Colors.blueAccent),
                    const SizedBox(height: 5),
                    weatherInfoCard(
                      title: "Humidity",
                      value: "${widget.weather.humidity} %",
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
                      value: "${widget.weather.pressure} hPa",
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
                      value: "${widget.weather.seaLevel} m",
                    ),
                  ],
                ),
              ],
            ),
            // Center(
            //   child: Container(
            //     width: 200.0,
            //     height: 200.0,
            //     decoration: BoxDecoration(
            //       image: DecorationImage(
            //         image: NetworkImage("https://openweathermap.org/img/wn/${widget.weather.weather[0].icon}@2x.png"),
            //
            //       fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),
          ],
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