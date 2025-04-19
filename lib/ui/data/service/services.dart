import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherly/ui/data/model/weather_model.dart';

class WeatherServices {
  String ApiKey =
      "https://api.openweathermap.org/data/2.5/weather?lat=23.89695357891459&lon=90.33100077096134&appid=08777520a05b92e6526442a57825b0cf&units=matric&exclude=hourly,daily";

  fetchWeather() async {
    final response = await http.get(Uri.parse(ApiKey));
    print(response.statusCode);
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        print(json);
        return WeatherData.fromJson(json);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
