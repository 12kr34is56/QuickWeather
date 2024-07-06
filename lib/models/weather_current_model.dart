import 'package:equatable/equatable.dart';

class WeatherCurrentModel extends Equatable {
  const WeatherCurrentModel({
    required this.data,
    required this.location,
  });

  final Data? data;
  final Location? location;

  WeatherCurrentModel copyWith({
    Data? data,
    Location? location,
  }) {
    return WeatherCurrentModel(
      data: data ?? this.data,
      location: location ?? this.location,
    );
  }

  factory WeatherCurrentModel.fromJson(Map<String, dynamic> json){
    return WeatherCurrentModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      location: json["location"] == null ? null : Location.fromJson(json["location"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "location": location?.toJson(),
  };

  @override
  List<Object?> get props => [
    data, location, ];
}

class Data extends Equatable {
  const Data({
    required this.time,
    required this.values,
  });

  final DateTime? time;
  final Map<String, double> values;

  Data copyWith({
    DateTime? time,
    Map<String, double>? values,
  }) {
    return Data(
      time: time ?? this.time,
      values: values ?? this.values,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      time: DateTime.tryParse(json["time"] ?? ""),
      values: Map.from(json["values"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time?.toIso8601String(),
    "values": Map.from(values).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };

  @override
  List<Object?> get props => [
    time, values, ];
}

class Location extends Equatable {
  const Location({
    required this.lat,
    required this.lon,
    required this.name,
    required this.type,
  });

  final double? lat;
  final double? lon;
  final String? name;
  final String? type;

  Location copyWith({
    double? lat,
    double? lon,
    String? name,
    String? type,
  }) {
    return Location(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      name: name ?? this.name,
      type: type ?? this.type,
    );
  }

  factory Location.fromJson(Map<String, dynamic> json){
    return Location(
      lat: json["lat"],
      lon: json["lon"],
      name: json["name"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
    "name": name,
    "type": type,
  };

  @override
  List<Object?> get props => [
    lat, lon, name, type, ];
}
