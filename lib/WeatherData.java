class WeatherData {
  final List<Map<String, dynamic>> minutely;
  final List<Map<String, dynamic>> hourly;
  final List<DailyWeather> daily;
  final Map<String, double> location;

  WeatherData({
    required this.minutely,
    required this.hourly,
    required this.daily,
    required this.location,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      minutely: List<Map<String, dynamic>>.from(json['timelines']['minutely']),
      hourly: List<Map<String, dynamic>>.from(json['timelines']['hourly']),
      daily: List<DailyWeather>.from(json['timelines']['daily'].map((model) => DailyWeather.fromJson(model))),
      location: {
        'lat': json['location']['lat']?.toDouble() ?? 0.0,
        'lon': json['location']['lon']?.toDouble() ?? 0.0,
      },
    );
  }
}
