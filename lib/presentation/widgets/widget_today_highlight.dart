import 'package:flutter/material.dart';
import 'package:weather_app_project/models/weather_current_model.dart';
import 'package:weather_app_project/presentation/widgets/widget_highlight_part.dart';

class WidgetTodayHighlight extends StatelessWidget {
  final WeatherCurrentModel? weather;
  const WidgetTodayHighlight({
    super.key, this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 30.0),
      child: Container(
        height: 240,
        width: double.infinity,
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.overlay,
          color: const Color(0xff202020),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.blueGrey),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              const Text(
                "Today's Highlight",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WidgetHighlightPart(
                    icon: Icons.wb_sunny,
                    title: weather?.data?.values['uvHealthConcern'] ?? '--',
                    subTitle: "UV Index",
                  ),
                  WidgetHighlightPart(
                    icon: Icons.air,
                    title: weather?.data?.values['windSpeed'] ?? '--',
                    subTitle: "Wind",
                  ),
                  WidgetHighlightPart(
                    icon: Icons.water_drop,
                    title: weather?.data?.values['humidity'] ?? '--',
                    subTitle: "Humidity",
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WidgetHighlightPart(
                    icon: Icons.thermostat,
                    title: weather?.data?.values['temperature'] ?? '--',
                    subTitle: "Temperature",
                  ),
                  WidgetHighlightPart(
                    icon: Icons.compress_outlined,
                    title: weather?.data?.values['pressureSurfaceLevel'] ?? '--',
                    subTitle: "pressure",
                  ),
                  WidgetHighlightPart(
                    icon: Icons.visibility,
                    title: weather?.data?.values['visibility'] ?? '--',
                    subTitle: "Visibility",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}