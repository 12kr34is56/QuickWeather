

class WeatherData {
  final Location location;
  final Map<String, List<WeatherValues>> timelines;

  WeatherData({required this.location, required this.timelines});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      location: Location.fromJson(json['location']),
      timelines: _parseTimelines(json['timelines']),
    );
  }

  static Map<String, List<WeatherValues>> _parseTimelines(
      Map<String, dynamic> timelinesJson) {
    Map<String, List<WeatherValues>> timelines = {};
    timelinesJson.forEach((key, value) {
      timelines[key] = value.map<WeatherValues>((e) => WeatherValues.fromJson(e)).toList();
    });
    return timelines;
  }
}

class Location {
  final double lat;
  final double lon;
  final String? name;

  Location({required this.lat, required this.lon,required this.name});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat'] as double,
      lon: json['lon'] as double,
      name: json['name'] as String?,
    );
  }
}

class WeatherValues {
  final String time;
  final Map<String, dynamic> values;

  WeatherValues({required this.time, required this.values});

  factory WeatherValues.fromJson(Map<String, dynamic> json) {
    return WeatherValues(
      time: json['time'],
      values: json['values'] as Map<String, dynamic>,
    );
  }
}