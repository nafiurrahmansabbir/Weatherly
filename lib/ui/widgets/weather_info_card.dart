import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../data/model/weather_model.dart';
import '../utilities/app_colors.dart';
import '../utilities/asset_paths.dart';

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

  // Mapping OpenWeatherMap icon codes to your asset paths for Lottie animations
  String getLottieAnimationPath(String iconCode) {
    switch (iconCode) {
      case '01d':
        return AssetPaths.clearSkyDayLottie;
      case '01n':
        return AssetPaths.clearSkyNightLottie;
      case '02d':
        return AssetPaths.fewCloudDLottie;
      case '02n':
        return AssetPaths.fewCloudNLottie;
      case '03d':
        return AssetPaths.clearSkyDayLottie;
        // return AssetPaths.scatteredCloudsLottie;
      case '03n':
        return AssetPaths.clearSkyDayLottie;
        // return AssetPaths.scatteredCloudsNightLottie;
      case '04d':
        return AssetPaths.brockenCloud;
        // return AssetPaths.brokenCloudsLottie;
      case '04n':
        return AssetPaths.brockenCloud;
        // return AssetPaths.brokenCloudsNightLottie;
      case '09d':
        return AssetPaths.clearSkyDayLottie;
        // return AssetPaths.showerRainLottie;
      case '09n':
        return AssetPaths.clearSkyDayLottie;
        // return AssetPaths.showerRainNightLottie;
      case '10d':
        return AssetPaths.clearSkyDayLottie;
        // return AssetPaths.rainLottie;
      case '10n':
        return AssetPaths.clearSkyDayLottie;
        // return AssetPaths.rainNightLottie;
      case '11d':
        return AssetPaths.clearSkyDayLottie;
        // return AssetPaths.thunderstormLottie;
      case '11n':
        return AssetPaths.clearSkyDayLottie;
        // return AssetPaths.thunderstormNightLottie;
      case '13d':
        return AssetPaths.clearSkyDayLottie;
        // return AssetPaths.snowLottie;
      case '13n':
        return AssetPaths.clearSkyDayLottie;
        // return AssetPaths.snowNightLottie;
      case '50d':
        return AssetPaths.clearSkyDayLottie;
        // return AssetPaths.mistLottie;
      case '50n':
        return AssetPaths.clearSkyDayLottie;
        // return AssetPaths.mistNightLottie;
      default:
        return AssetPaths.clearSkyDayLottie;
        // return AssetPaths.defaultWeatherLottie; // Default animation if no match
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(AppColors.cardOpacity),
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
            const SizedBox(height: 10),

            // Center(
            //   child: SizedBox(
            //     width: 200.0,
            //     height: 200.0,
            //     child: Lottie.asset(
            //       getLottieAnimationPath(weather.weather[0].icon), // Get the correct Lottie path
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            Center(
              child: Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://openweathermap.org/img/wn/${weather.weather[0].icon}@2x.png"),

                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Weather description
            Center(
              child: Text(
                weather.weather[0].description,
                style: TextStyle(fontSize: 24),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
