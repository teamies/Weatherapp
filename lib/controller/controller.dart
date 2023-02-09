import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:my_weather/Models/currentweather.dart';
import 'package:my_weather/Models/daily.dart';
import 'package:my_weather/Models/hourly.dart';
import 'package:my_weather/Models/response.dart';
import 'package:my_weather/Models/seach.dart';
import 'package:my_weather/Models/temp.dart';

class Controller {
  late Response _response;

  Controller() {
    this._response = new Response(result: {}, code: 404);
  }

  /**
   * Trường hợp không cần API
   */

  // Future<Response> getData(double lat, double lon) async {
  //   final contents = await rootBundle.loadString('assets/db.json');
  //   this._response.result = jsonDecode(contents);
  //   return this._response;
  // }

  Future<Response> getData(Town town) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${town.lat}&lon=${town.lon}&units=metric&appid=ac2e59088cbe65dddd76cc799a3f7efb'));
    if (response.statusCode == 200) {
      this._response.result = jsonDecode(response.body);
    } else {
      print('error retrieving location for city: ${response.statusCode}');
    }
    return this._response;
  }

  CurrentWeather get_current() {
    CurrentWeather currentWeather =
        CurrentWeather.fromJson(this._response.result['current']);
    return currentWeather;
  }

  Temp getTemDaily({int key = 0}) {
    Temp temp = Temp.fromJson(this._response.result['daily'][key]['temp']);
    return temp;
  }

  List<Daily> getDaily() {
    List<Daily> dailyList = [];

    for (var item in this._response.result['daily']) {
      final daily = Daily.fromJson(item);
      dailyList.add(daily);
    }

    return dailyList;
  }

  List<Hourly> gethourly() {
    List<Hourly> hourlyList = [];

    for (var item in this._response.result['hourly']) {
      final hourly = Hourly.fromJson(item);
      hourlyList.add(hourly);
    }

    return hourlyList;
  }

  Future<List<Town>> searchTown() async {
    List<Town> listTown = [];
    final response = await http.get(Uri.parse(
        'http://api.openweathermap.org/geo/1.0/direct?q=Than,VN&limit=5&appid=ac2e59088cbe65dddd76cc799a3f7efb'));
    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      for (var item in json) {
        print(item);
      }
    } else {
      print('error retrieving location for city: ${response.statusCode}');
    }

    return listTown;
  }
}
