import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherly/ui/utilities/app_colors.dart';
import '../data/model/weather_model.dart';
import '../data/service/services.dart';
import 'package:geolocator/geolocator.dart';
import '../widgets/loadin_animation/weather_details_info_card_skelton.dart';
import '../widgets/weather_details_info_card.dart';
import '../widgets/weather_info_card.dart';
import '../widgets/loadin_animation/weather_info_card_skelton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late WeatherData weather;
  bool isLoading = false;
  String lat = '';
  String lon = '';

  getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      Position currentposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      lat = currentposition.latitude.toString();
      lon = currentposition.longitude.toString();
    }
    myWeather();
  }

  myWeather() {
    WeatherServices().fetchWeather(lat, lon).then((value) {
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
      country: '',
      temperature: Temperature(current: 0.0),
      humidity: 0,
      wind: Wind(speed: 0.0),
      maxTemperature: 0,
      minTemperature: 0,
      pressure: 0,
      seaLevel: 0,
      weather: [
        WeatherInfo(
          main: '',
          description: '',
          icon: '01d', // 🌞 default sunny icon
        ),
      ],
    );

    getCurrentLocation();
  }
  final TextEditingController searchTEController =TextEditingController();

  @override
  Widget build(BuildContext context) {

    String formattedDate = DateFormat(
      'EEEE d, MMMM yyyy',
    ).format(DateTime.now());
    String formattedTime = DateFormat('hh:mm a').format(DateTime.now());
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weatherly'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isLoading = false;
              });
              getCurrentLocation();
            },
            icon: Icon(Icons.my_location),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: searchTEController,
                textInputAction: TextInputAction.search,
                onFieldSubmitted: (value) {
                  WeatherServices().fetchWeatherByCity(searchTEController.text).then((value){
                    setState(() {
                      isLoading=false;
                    });
                    setState(() {
                      weather = value;
                      isLoading = true;
                    });
                    _clearTexFieldTex();
                  });
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  // fillColor: AppColors.themeColor.withOpacity(0.2),
                  filled: true,
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),

                ),
              ),
              SizedBox(height: 10),
              Visibility(
                visible: isLoading == true,
                replacement: WeatherInfoCardSkelton(screenWidth: screenWidth),
                child: WeatherInfoCard(
                  formattedDate: formattedDate,
                  formattedTime: formattedTime,
                  weather: weather,
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
              SizedBox(height: 20,),

              Visibility(
                visible: isLoading == true,
                replacement: WeatherDetailsInfoCardSkelton(),
                child: WeatherDetailsInfoCard(weather: weather),
              ),
              const SizedBox(height: 30,),




            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    searchTEController.dispose();
    super.dispose();
  }
  void _clearTexFieldTex(){
    searchTEController.clear();
  }
}
