import 'package:my_weather/Models/weather.dart';

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

  static windDegCondition(num windDeg) {
    if (windDeg == 0 && windDeg == 360) {
      return 'Bắc';
    } else if (0 < windDeg && windDeg <= 22.5) {
      return 'Bắc đông bắc';
    } else if (22.5 < windDeg && windDeg <= 67.5) {
      return 'Đông bắc';
    } else if (67.5 < windDeg && windDeg < 90) {
      return 'Đông đông bắc';
    } else if (90 == windDeg) {
      return 'Đông';
    } else if (90 < windDeg && windDeg <= 112.5) {
      return 'Đông đông nam';
    } else if (112.5 < windDeg && windDeg <= 157.5) {
      return 'Đông nam';
    } else if (157.5 < windDeg && windDeg < 180) {
      return 'Nam đông nam';
    } else if (180 == windDeg) {
      return 'Nam';
    } else if (180 < windDeg && windDeg <= 202.5) {
      return 'Nam tây nam';
    } else if (202.5 < windDeg && windDeg <= 247.5) {
      return 'Tây nam';
    } else if (247.5 < windDeg && windDeg < 270) {
      return 'Tây tây nam';
    } else if (270 == windDeg) {
      return 'Tây ';
    } else if (270 < windDeg && windDeg <= 292.5) {
      return 'Tây tây bắc';
    } else if (292.5 < windDeg && windDeg <= 337.5) {
      return 'Tây bắc';
    } else if (337.5 < windDeg && windDeg < 360) {
      return 'Bắc tây bắc';
    }
    return windDeg;
  }
}
