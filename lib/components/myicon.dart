import 'package:flutter/material.dart';
import 'package:my_weather/core/tocolor.dart';
import 'package:my_weather/core/_config.dart' as cnf;

class MyIcon extends StatelessWidget {
  late IconData icon;
  late String color;
  late int size;

  MyIcon({required this.icon, this.size = 18, this.color = cnf.colorWhite});

  @override
  Widget build(BuildContext context) {
    return Icon(
      this.icon,
      size: this.size.toDouble(),
      color: this.color.toColor(),
    );
    throw UnimplementedError();
  }
}
