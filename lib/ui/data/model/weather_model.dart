class WeatherData {
  final String name;
  final String country;
  final Temperature temperature;
  final int humidity;
  final Wind wind;
  final double maxTemperature;
  final double minTemperature;
  final int pressure;
  final int seaLevel;
  final List<WeatherInfo> weather; // 🔹 Already included — holds main/desc/icon

  WeatherData({
    required this.name,
    required this.country,
    required this.temperature,
    required this.humidity,
    required this.wind,
    required this.maxTemperature,
    required this.minTemperature,
    required this.pressure,
    required this.seaLevel,
    required this.weather,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      name: json['name'],
      country: json['sys']['country'],
      temperature: Temperature.fromJson(json['main']['temp']),
      humidity: json['main']['humidity'],
      wind: Wind.fromJson(json['wind']),
      maxTemperature: json['main']['temp_max'].toDouble(),
      minTemperature: json['main']['temp_min'].toDouble(),
      pressure: json['main']['pressure'],
      seaLevel: json['main']['sea_level'] ?? 0,
      weather: List<WeatherInfo>.from(
        json['weather'].map(
              (weather) => WeatherInfo.fromJson(weather),
        ),
      ),
    );
  }
}

// 🔹 Modified: added description and icon
class WeatherInfo {
  final String main;         // e.g., "Clouds"
  final String description;  // 🔹 Added: e.g., "few clouds"
  final String icon;         // 🔹 Added: e.g., "02d"

  WeatherInfo({
    required this.main,
    required this.description, // 🔹 Added
    required this.icon,        // 🔹 Added
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      main: json['main'],
      description: json['description'], // 🔹 Added
      icon: json['icon'],              // 🔹 Added
    );
  }
}

class Temperature {
  final double current;

  Temperature({required this.current});

  factory Temperature.fromJson(dynamic json) {
    return Temperature(
      current: json.toDouble(),
    );
  }
}

class Wind {
  final double speed;

  Wind({required this.speed});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(speed: json['speed'].toDouble());
  }
}
