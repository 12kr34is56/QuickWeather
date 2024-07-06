import 'package:flutter/material.dart';
import 'package:weather_app_project/models/weather_forecast_model.dart';
import 'package:weather_app_project/presentation/widgets/widgets.dart';
import 'package:weather_app_project/services/services.dart';


class WeatherScreen extends StatefulWidget {
  final String location;
  final WeatherData? weatherData;

  const WeatherScreen({super.key, required this.location, required this.weatherData});
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {


  @override
  Widget build(BuildContext context) {
    final weatherData = widget.weatherData!;
    return Flexible(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherData.timelines['daily']!.length,
        itemBuilder: (context, index) {
          final weather = weatherData.timelines['daily']![index];
          return

            WidgetWeeksContainer(
              dayName: getDayOfWeek(weather.time),
              weatherTypeIcon:
              weatherIconWeek(weather.values['weatherCodeMax']),
              min: '${weather.values["temperatureMin"]}',
              max:
              '${weather.values["temperatureMax"]}',
              weatherType: weatherText(weather.values['weatherCodeMax']),
            );
        },
      ),
    );
  }
}

