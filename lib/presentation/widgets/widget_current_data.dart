import 'package:flutter/material.dart';
import 'package:weather_animation/weather_animation.dart';
import 'package:weather_app_project/presentation/widgets/widget_current_weather_loader.dart';

import '../../models/weather_current_model.dart';
import '../../services/weather_api.dart';
import '../../services/weather_theme.dart';
import '../screens/detail_screen.dart';

class WidgetCurrentData extends StatefulWidget {
  final String location;
  final WeatherCurrentModel? weather;
  const WidgetCurrentData({
    Key? key,
    required this.location,
    this.weather,
  }) : super(key: key);

  @override
  State<WidgetCurrentData> createState() => _WidgetCurrentDataState();
}

class _WidgetCurrentDataState extends State<WidgetCurrentData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                location: widget.location,
              ),
            ),
          );
        },
        child: Row(
          children: [
            Container(
              height: 165,
              width: MediaQuery.of(context).size.width *
                  0.5, // Adjusted MediaQuery usage
              decoration: const BoxDecoration(
                backgroundBlendMode: BlendMode.overlay,
                color: Color(0xff202020),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.weather?.data?.values['temperature'] ?? '--'}º',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 50,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Feels like ${widget.weather?.data?.values['temperatureApparent'] ?? '--'}º",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 15),
                    ),
                    Text(
                      'Location : ${widget.weather?.location?.name ?? 'Unknown'}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              // Use Expanded to ensure WrapperScene takes remaining space
              child: Container(
                  height: 165,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: const BoxDecoration(
                    backgroundBlendMode: BlendMode.softLight,
                    color: Color(0xff202020),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: WrapperScene(
                    colors: [],
                    children: [
                      CloudWidget(
                        cloudConfig: CloudConfig(
                            scaleBegin: 0.9,
                            scaleEnd: 1,
                            widgetCloud: Text(
                                weatherIcon(widget
                                    .weather?.data?.values['weatherCode']),
                                style: const TextStyle(
                                  fontSize: 300,
                                  color: Colors.white,
                                ))),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
