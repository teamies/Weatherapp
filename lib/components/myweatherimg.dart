import 'package:flutter/material.dart';

class MyWeatherImg extends StatelessWidget {
  String name;

  MyWeatherImg({this.name = ''});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'http://openweathermap.org/img/wn/${this.name}@2x.png',
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Image.asset('assets/img/imgfail.png');
      },
    );
    throw UnimplementedError();
  }
}
