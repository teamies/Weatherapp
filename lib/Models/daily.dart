import 'package:my_weather/Models/feelslike.dart';
import 'package:my_weather/Models/temp.dart';
import 'package:my_weather/Models/weather.dart';

class Daily {
  int dt;
  int sunrise;
  int sunset;
  int moonrise;
  int moonset;
  String moonPhase;
  Temp temp;
  FeelsLike feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double windSpeed;
  int windDeg;
  double windGust;
  List<Weather> weather;
  int clouds;
  double pop;
  double rain;
  double uvi;

  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.rain,
    required this.uvi,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonrise: json['moonrise'],
      moonset: json['moonset'],
      moonPhase: moonPhaseCondition(json['moon_phase']),
      temp: Temp.fromJson(json['temp']),
      feelsLike: FeelsLike.fromJson(json['feels_like']),
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'],
      windSpeed: json['wind_speed'],
      windDeg: json['wind_deg'],
      windGust: json['wind_gust'],
      weather: (json['weather'] as List).map((i) => Weather.fromJson(i)).toList(),
      clouds: json['clouds'],
      pop: json['pop'].toDouble(),
      rain: json['rain'],
      uvi: json['uvi'].toDouble(),
    );
  }

  static moonPhaseCondition(num moonPhase) {
    if (moonPhase == 0 && moonPhase == 1) {
      return ' Trăng non';
    } else if (0 < moonPhase && moonPhase < 0.25 || 0.75 < moonPhase && moonPhase < 1) {
      return 'Trăng lưỡi liềm';
    } else if (0.25 == moonPhase ) {
      return 'Bán nguyệt đầu tháng';
    }else if (0.75 == moonPhase ) {
      return 'Bán nguyệt cuối tháng';
    }else if (0.5 == moonPhase ) {
      return 'Trăng tròn';
    }
    return 'Trăng khuyết';
  }
}