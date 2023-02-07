import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_weather/Models/hourly.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:my_weather/components/myweatherimg.dart';
import 'package:my_weather/screens/hourlydetail.dart';

class HourlyScreen extends StatelessWidget {
  final List<Hourly> hourly;
  HourlyScreen({required this.hourly});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 1, child: MyText.baseText(text: 'Dự báo theo giờ')),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HourlyDetail(
                              hourly: this.hourly,
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
                return Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText.hourText(text: this.hourly[index].dt),
                      Container(
                          width: 40,
                          height: 40,
                          child: MyWeatherImg(
                            name: this.hourly[index].weather[0].icon,
                          )),
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
