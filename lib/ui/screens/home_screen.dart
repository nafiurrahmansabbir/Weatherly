import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherly/ui/data/service/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherServices weatherServices = WeatherServices();
  @override
  void initState() {
    super.initState();
    weatherServices.fetchWeather();
  }
  @override
  Widget build(BuildContext context) {

    String formattedDate =
    DateFormat('EEEE d, MMMM yyyy').format(DateTime.now());
    String formattedTime = DateFormat('hh:mm a').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: Text('Weatherly'),

      ),

    );
  }
}

