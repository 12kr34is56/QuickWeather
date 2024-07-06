import 'package:flutter/material.dart';
import 'package:weather_app_project/models/weather_current_model.dart';
import 'package:weather_app_project/models/weather_forecast_model.dart';
import 'package:weather_app_project/presentation/widgets/widgets.dart';
import 'package:weather_app_project/services/services.dart';


class HomeScreen extends StatelessWidget {
  // final num weatherCode;
  final WeatherCurrentModel? weatherData;
  final String location;
  final WeatherData? weatherForecast;
  const HomeScreen({
    super.key,
    required this.location,
    required this.weatherData, this.weatherForecast,
    // this.weatherForecast
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181818),
      body: SafeArea(
        child: Stack(
          children: [
            getWeatherConditionWidget(
                context, weatherData?.data?.values['weatherCode'] ?? 1000),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetHeading(
                  locationName: location,
                  time : weatherData!.data!.time,
                ),
                const SizedBox(
                  height: 25,
                ),
                WidgetCurrentData(
                  location: location,
                  weather: weatherData,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0, bottom: 10),
                  child: Text(
                    'Weekly Forecast',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                WeatherScreen(
                  location: location,
                  weatherData: weatherForecast,
                ),

                WidgetTodayHighlight(
                  weather: weatherData,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
