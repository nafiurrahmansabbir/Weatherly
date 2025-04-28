import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:weatherly/ui/data/model/weather_model.dart';

var logger=Logger();

class WeatherServices {
  Future<WeatherData> fetchWeather(String lat, String lon) async {
    String apiUrl =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=08777520a05b92e6526442a57825b0cf&units=metric&exclude=hourly,daily";

    try {
      final response = await http.get(Uri.parse(apiUrl));
      logger.i(response.statusCode);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        logger.i(json);
        return WeatherData.fromJson(json);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }

  Future<WeatherData> fetchWeatherByCity(String cityName) async {
    String ApiKey =
        "http://api.openweathermap.org/data/2.5/weather/?appid=08777520a05b92e6526442a57825b0cf&q=${cityName}&units=metric";
    final response = await http.get(Uri.parse(ApiKey));
    logger.i(response.statusCode);
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        logger.i(json);
        return WeatherData.fromJson(json);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print(e.toString());
      logger.e(e.toString());
      rethrow;
    }
  }
}
