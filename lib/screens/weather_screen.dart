import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:minimal_social_media_app/database/sd.dart';
import 'package:minimal_social_media_app/models/weather_model.dart';
import 'package:minimal_social_media_app/services/weather_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _weatherService = WeatherService(SD.apiKey);
  Weather? _weather;

  //fetch weather
  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    //get weather for current city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  //weather animations
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/weather-animation-cloudy.json';
    switch (mainCondition.toLowerCase()) {
      case 'fog':
      case 'mist':
      case 'dust':
      case 'haze':
      case 'smoke':
      case 'clouds':
        return 'assets/weather-animation-cloudy.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/weather-animation-rainy.json';
      case 'clear':
        return 'assets/weather-animation-bright.json';
      case 'sunny':
        return 'assets/weather-animation-sunny.json';
      case 'thunderstorm':
        return 'assets/weather-animation-thunder.json';
      default:
        return 'assets/weather-animation-cloudy.json';
    }
  }

  //init state
  @override
  void initState() {
    super.initState();

    //fetch weather on app startup
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("W A L L"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_weather?.cityName ?? "Loading city..."),
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
            Text('${_weather?.temperature.round()}°C'),
            Text(_weather?.mainCondition ?? "Loading description..."),
          ],
        ),
      ),
    );
  }
}
