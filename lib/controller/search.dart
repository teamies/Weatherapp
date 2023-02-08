import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_weather/Models/seach.dart';

class Search {
  Future<List<Town>> getName(String city) async {
    late List<Town> _list = [];

    final response = await http.get(Uri.parse(
        'http://api.openweathermap.org/geo/1.0/direct?q=${city},VN&limit=5&appid=ac2e59088cbe65dddd76cc799a3f7efb'));
    if (response.statusCode == 200) {
      print("-----------Search Controllera--------------");
      List<dynamic> _json = jsonDecode(response.body);
      Town _Town;
      if (_json.length > 0) {
        _json.forEach((element) {
          if (element.containsKey('local_names') &&
              element.containsKey('state')) {
            _Town = Town.fromJson(element);
            _list.add(_Town);
          }
        });
        return _list;
      }
    } else {
      print('error retrieving Town for city $city: ${response.statusCode}');
    }
    return _list;
  }
}
