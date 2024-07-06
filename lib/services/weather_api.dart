import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_current_model.dart';
import '../models/weather_forecast_model.dart';


class WeatherApi{
  static const BASE_URL = 'https://api.tomorrow.io/v4/weather';
  static const forecast = '/forecast?';
  static const realtime = '/realtime?';
  static const API_KEY = 'idQpanlPIphO8sfbobsFS7RAtnmjdMSy';
  // static const API_KEY = 'fmAXvyAitdIOzgc9epkXilz2ozEUh0hs';
  // static const API_KEY = 'JxpQKwZF1ViYfXncp6r2dgQWuhGx2drR';


  static Future<WeatherCurrentModel> getWeatherCurrent(String location) async {
    final response = await http.get(Uri.parse('$BASE_URL$realtime' + 'location=${location}&apikey=$API_KEY'));
    if (response.statusCode == 200) {
      return WeatherCurrentModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
  static Future<WeatherData> getForecast(String location) async {
    final url = Uri.parse("$BASE_URL$forecast"+"location=$location&apikey=$API_KEY");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return WeatherData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch weather data. Status code: ${response.statusCode}');
    }
  }

}