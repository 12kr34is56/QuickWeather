import 'package:flutter/material.dart';

class WidgetWeeksContainer extends StatelessWidget {
  final String dayName;
  final String weatherTypeIcon;
  final String min;
  final String max;
  final String weatherType;

  const WidgetWeeksContainer({
    super.key,
    required this.dayName,
    required this.weatherTypeIcon,

    required this.weatherType, required this.min, required this.max,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, bottom: 20),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: const Color(0xff202020),
            border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(30),
            backgroundBlendMode: BlendMode.overlay),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                dayName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                weatherTypeIcon,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                min.substring(0,2) + "°/" + max.substring(0,2) + "°",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                weatherType,
                style: const TextStyle(color: Colors.white, fontSize: 13,fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
