import 'package:flutter/material.dart';

import '../data/model/weather_model.dart';
import '../utilities/app_colors.dart';

class WeatherInfoCard extends StatelessWidget {
  const WeatherInfoCard({
    super.key,
    required this.formattedDate,
    required this.formattedTime,
    required this.weather,
  });

  final String formattedDate;
  final String formattedTime;
  final WeatherData weather;

  @override
  Widget build(BuildContext context) {
    return Container(
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

            Row(
              children: [
                Text("${weather.name} , ", style: TextStyle(fontSize: 25)),
                Text(weather.country, style: TextStyle(fontSize: 25)),
              ],
            ),
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
    );
  }
}