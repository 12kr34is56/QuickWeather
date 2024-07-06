import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';

String weatherIcon(double? weatherCode) {
  switch (weatherCode) {
    case 1000:
      return "🌞"; // Clear
    case 1001:
      return "☁️"; // Cloudy
    case 1100:
      return "⛅"; // Partly Cloudy
    case 1101:
      return "🌤️"; // Mostly Clear
    case 2000:
      return "😶‍🌫️"; // Fog
    case 2100:
      return "‍🌫️"; // Light Fog
    case 3000:
      return "💨🌬️"; // Wind
    case 4000:
    case 4200:
      return "🌧️"; // Drizzle
    case 5000:
      return "❄️"; // Snow
    case 6000:
      return "🌨️"; // Freezing Rain
    case 7000:
      return "🌩️"; // Thunderstorm
    case 8000:
      return "🌪️"; // Tornado
    default:
      return "☁️"; // Unknown
  }
}

String weatherIconWeek(int weatherCode) {
  switch (weatherCode) {
    case 1000:
      return "🌞"; // Clear
    case 1001:
      return "☁️"; // Cloudy
    case 1100:
      return "⛅"; // Partly Cloudy
    case 1101:
      return "🌤️"; // Mostly Clear
    case 2000:
      return "😶‍🌫️"; // Fog
    case 2100:
      return "‍🌫️"; // Light Fog
    case 3000:
      return "💨🌬️"; // Wind
    case 4000:
    case 4200:
      return "🌧️"; // Drizzle
    case 5000:
      return "❄️"; // Snow
    case 6000:
      return "🌨️"; // Freezing Rain
    case 7000:
      return "🌩️"; // Thunderstorm
    case 8000:
      return "🌪️"; // Tornado
    default:
      return "☁️"; // Unknown
  }
}

String weatherText(int weatherCode) {
  switch (weatherCode) {
    case 1000:
      return "Clear"; // Clear
    case 1001:
      return "Cloudy"; // Cloudy
    case 1100:
      return "Partly Cloudy"; // Partly Cloudy
    case 1101:
      return "Mostly Clear"; // Mostly Clear
    case 2000:
      return "Fog"; // Fog
    case 2100:
      return "Light Fog"; // Light Fog
    case 3000:
      return "Wind"; // Wind
    case 4000:
    case 4200:
      return "Rainy"; // Drizzle
    case 5000:
      return "Snow"; // Snow
    case 6000:
      return "Freezing Rain"; // Freezing Rain
    case 7000:
      return "Thunderstorm"; // Thunderstorm
    case 8000:
      return "Tornado"; // Tornado
    default:
      return "Unknown"; // Unknown
  }
}

Widget getWeatherConditionWidget(BuildContext context, num weatherCode) {
  switch (weatherCode) {
    case 1000: //no change
      return WeatherBg(
        weatherType: WeatherType.sunny,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      );
    case 9000: //no change
      return WeatherBg(
        weatherType: WeatherType.sunnyNight,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      );
    case 1100:
    case 1101:
    case 1102: //change
      return WeatherBg(
        weatherType: WeatherType.cloudy,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      );
    case 1001: //change
      return WeatherBg(
        weatherType: WeatherType.overcast,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      );
    case 4200: //no change
    case 4000: //no change
      return WeatherBg(
        weatherType: WeatherType.lightRainy,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      );
    case 6200: //no change
    case 6000: //no change
      return WeatherBg(
        weatherType: WeatherType.lightSnow,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      );
    case 7000: //no change
      return WeatherBg(
        weatherType: WeatherType.foggy,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      );
    case 7101: //no change
      return WeatherBg(
        weatherType: WeatherType.hazy,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      );
    case 7102: //no change
      return WeatherBg(
        weatherType: WeatherType.dusty,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      );
    case 8000: //no change
      return WeatherBg(
        weatherType: WeatherType.thunder,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      );
    default:
      return WeatherBg(
        weatherType: WeatherType.sunny,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      );
  }
}
