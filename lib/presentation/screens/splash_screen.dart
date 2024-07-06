import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_project/models/weather_current_model.dart';
import 'package:weather_app_project/models/weather_forecast_model.dart';
import 'package:weather_app_project/presentation/screens/screens.dart';
import 'package:weather_app_project/services/services.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GeolocationService _geolocationService = GeolocationService();

  @override
  void initState() {
    super.initState();
    _getLocationAndNavigate();
  }

  Future<void> _getLocationAndNavigate() async {
    try {
      Position position = await _geolocationService.determinePosition();
      String city = await _geolocationService.getCity(position);
      WeatherData weatherForecast = await WeatherApi.getForecast(city);
      WeatherCurrentModel weatherData =
          await WeatherApi.getWeatherCurrent(city);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            location: city,
            weatherData: weatherData,
            weatherForecast: weatherForecast,
          ),
        ),
      );
    } catch (e) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            location: e.toString(),
            weatherData: null, // Default weather code in case of an error
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Fetching location and weather data...'),
          ],
        ),
      ),
    );
  }
}
