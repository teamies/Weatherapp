import 'package:flutter/material.dart';
import 'package:my_weather/Models/currentweather.dart';
import 'package:my_weather/Models/temp.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:my_weather/components/myweatherimg.dart';

class CurrentWeatherScreen extends StatelessWidget {
  final CurrentWeather weather;
  final Temp temp;
  const CurrentWeatherScreen({required this.weather, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 40),
      height: MediaQuery.of(context).size.height / 4.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 100,
                  width: 100,
                  child: MyWeatherImg(
                    name: this.weather.weather[0].icon,
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: MyText.temp(temp: this.weather.temp, size: 50))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.vertical_align_top,
                      color: Colors.white,
                    ),
                    MyText.temp(temp: this.temp.max, size: 14)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.vertical_align_bottom,
                      color: Colors.white,
                    ),
                    MyText.temp(temp: this.temp.min, size: 14)
                  ],
                ),
              ),
              MyText.temp(
                  text: 'Cảm Giác Như ', temp: this.weather.feelsLike, size: 14)
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 15),
              child:
                  MyText.baseText(text: this.weather.weather[0].description)),
        ],
      ),
    );
  }
}
