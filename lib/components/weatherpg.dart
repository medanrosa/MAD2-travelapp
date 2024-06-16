import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/weathermodel.dart';
import '../services/weatherservices.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService("b4035756388ed0d6aed80e14ccd42200");
  Weather? _weather;
  String? _error;

  Future<void> fetchWeather() async {
    // Get the current position
    Position position;
    try {
      position = await _weatherService.getCurrentPosition();
      print('Current position: ${position.latitude}, ${position.longitude}');
    } catch (e) {
      setState(() {
        _error = 'Failed to get current position';
      });
      return;
    }

    // Get weather for the current position
    try {
      final weather = await _weatherService.getWeatherByCoordinates(position.latitude, position.longitude);
      setState(() {
        _weather = weather;
        _error = null;
      });
    } catch (e) {
      print('Error: $e'); // Debug logging
      setState(() {
        _error = 'Failed to load weather data';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch weather on startup
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text("Weather"),
        ),
      body: Center(
        child: _error != null
            ? Text(_error!, style: TextStyle(color: Colors.red, fontSize: 20))
            : _weather == null
            ? CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // City name
            Text(_weather!.cityName, style: TextStyle(fontSize: 24)),
            // Temperature
            Text('${_weather!.temperature.round()}°C', style: TextStyle(fontSize: 24)),
            // Main condition
            Text(_weather!.mainCondition, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
