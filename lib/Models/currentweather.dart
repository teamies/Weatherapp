import 'package:my_weather/Models/weather.dart';
import 'package:my_weather/core/convert.dart';

class CurrentWeather {
  final int dt,sunrise,sunset,clouds,visibility,pressure,humidity;
  final String windDeg;
  final double temp,feelsLike,dewPoint,uvi,windSpeed,windGust;
  final List<Weather> weather;

  CurrentWeather({
    required this.dt,
    required this.sunrise,
    required this.sunset,
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
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
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
      weather: (json['weather'] as List).map((e) => Weather.fromJson(e)).toList(),
    );
  }

  
}
