import 'dart:convert';
import 'dart:ffi';
import 'package:my_weather/Models/seach.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Local {
  Future<void> addToList(Town town) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('town_list');
    List<dynamic> list = [];
    if (data != null) {
      list = jsonDecode(data);
      int index = list.indexWhere(
          (item) => item['lat'] == town.lat && item['lon'] == town.lon);
      if (index != -1) {
        print("This town is already in the list.");
        list.removeAt(index);
      }
      list.insert(0, town.toJson());
      prefs.setString('town_list', jsonEncode(list));
    } else {
      list.add(town.toJson());
      prefs.setString('town_list', jsonEncode(list));
    }
  }

  /**
   * if value = false get list[0] else get all
   */
  Future<List<dynamic>> getList({bool value = true}) async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('town_list');
    final data = prefs.getString('town_list');
    if (data != null) {
      return jsonDecode(data);
    }
    return [];
  }
}
