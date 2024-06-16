import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:negombo/models/weathermodel.dart';

class WeatherService {
  static const BASE_URL = 'http://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> getWeatherByCoordinates(double latitude, double longitude) async {
    final url = '$BASE_URL?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
    print('Requesting weather data from: $url'); // Debug logging

    final response = await http.get(Uri.parse(url));

    print('Response status: ${response.statusCode}'); // Debug logging
    print('Response body: ${response.body}'); // Debug logging

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<Position> getCurrentPosition() async {
    // Get permission from user
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // Fetch the current location
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}
