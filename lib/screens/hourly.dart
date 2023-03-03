import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_weather/Models/currentweather.dart';
import 'package:my_weather/Models/daily.dart';
import 'package:my_weather/Models/hourly.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:my_weather/components/myweatherimg.dart';
import 'package:my_weather/core/icon.dart';
import 'package:my_weather/screens/hourlydetail.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class HourlyScreen extends StatelessWidget {
  final List<Hourly> hourly;
  // final CurrentWeather weather;
  final List<Daily> daily;
  HourlyScreen({required this.hourly, required this.daily});
  @override
  Widget build(BuildContext context) {
     final  date = ((DateTime.now().millisecondsSinceEpoch)/1000).toInt();
    //  final date = 1676293200;
    // bool checkDay = (date) > (this.weather.sunrise) && date < (this.weather.sunset);
    Widget text;
    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 1, child: MyText.baseText(text: 'Dự báo theo giờ')),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    SwipeablePageRoute(
                        builder: (context) => HourlyDetail(
                              hourly: this.hourly,
                              // weather: this.weather,
                              daily: this.daily,
                            )),
                  );
                },
                child: MyText.baseText(
                    text: 'Thêm',
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w300))
          ],
        ),
        Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
                borderRadius: BorderRadius.circular(20)),
            height: MediaQuery.of(context).size.height / 3.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 24,
              itemBuilder: (context, index) {

              bool checkDay = ((this.hourly[index].dt) > (this.daily[0].sunrise) && (this.hourly[index].dt) < (this.daily[0].sunset)) || ((this.hourly[index].dt) > (this.daily[1].sunrise) && (this.hourly[index].dt) < (this.daily[1].sunset)) ;
                return Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>HourlyDetail(hourly: this.hourly,  daily: this.daily,)));
                        },
                        child: MyText.hourText(text: this.hourly[index].dt)),
                      Container(
                          width: 40,
                          height: 40,
                          child: 
                          // MyWeatherImg(
                          //   name: this.hourly[index].weather[0].icon,
                          // )
                           getIconPlatForm(checkDay, this.hourly[index].weather[0].description)
                          ),
                      MyText.temp(temp: this.hourly[index].temp),
                    ],
                  ),
                );
              },
            )),
      ],
    );
  }
}
