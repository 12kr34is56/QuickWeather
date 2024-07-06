import 'package:flutter/material.dart';

class HourlyUpdate extends StatelessWidget {
  final String time;
  final String weatherIcon;
  final String weather;
  final String temp;

  const HourlyUpdate({
    super.key,
    required this.time,
    required this.weatherIcon,
    required this.weather,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            time,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              Text(
                weatherIcon,
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                weather,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Text(
            "$tempº",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}