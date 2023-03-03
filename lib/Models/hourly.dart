import 'package:my_weather/Models/rain.dart';
import 'package:my_weather/Models/weather.dart';
import 'package:my_weather/core/convert.dart';

class Hourly {
  int dt;
  double temp;
  double feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double uvi;
  int clouds;
  int visibility;
  double windSpeed;
  String windDeg;
  double windGust;
  List<Weather> weather;
  Rain? rain;
  double pop;

  Hourly({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.rain,
    required this.pop,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      dt: json['dt'],
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'].toDouble(),
      uvi: json['uvi'].toDouble(),
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: json['wind_speed'].toDouble(),
      windDeg: windDegCondition(json['wind_deg']),
      windGust: json['wind_gust'].toDouble(),
      weather:
          (json['weather'] as List).map((i) => Weather.fromJson(i)).toList(),
      // rain:Rain.fromJson(json['rain']),
      rain : json['rain'] != null ? Rain.fromJson(json['rain']) : null ,
      
      pop: json['pop'].toDouble(),
      
    );
  }
}
