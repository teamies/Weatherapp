import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_weather/Models/seach.dart';
import 'package:my_weather/components/myappbartext.dart';
import 'package:my_weather/components/mydrawer.dart';
import 'package:my_weather/components/myicon.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_weather/controller/controller.dart';
import 'package:my_weather/screens/daily.dart';
import 'package:my_weather/screens/currentdetail.dart';
import 'package:my_weather/screens/currentweather.dart';
import 'package:my_weather/screens/hourly.dart';
import 'package:my_weather/screens/search.dart';

class Home extends StatefulWidget {
  late Town town;
  Home({required this.town});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Controller _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new Controller();
    print('load home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: const Color(0xff123EB9),
          title: MyAppBarText(cityName: this.widget.town.name),
          actions: [
            IconButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => searchView()),
                );
              },
              icon: MyIcon(icon: Icons.add_circle_outline),
            ),
          ],
        ),
        body: Container(
            padding:
                const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
            // color: Colors.blue.shade200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/img/imgThienNhien1.jpg"))),
            child: FutureBuilder(
              future: _controller.getData(this.widget.town),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // _controller.getHourly();
                  return ListView(
                    children: [
                      Column(
                        children: [
                          CurrentWeatherScreen(
                            weather: _controller.get_current(),
                            temp: _controller.getTemDaily(),
                          ),
                          HourlyScreen(hourly: _controller.gethourly()),
                          // CurrentDetail(
                          //   currentWeather: _controller.get_current(),
                          //   dailyWeather: _controller.getDaily(),
                          // ),
                          // DailyScreen(daily: _controller.getDaily()),
                        ],
                      )
                    ],
                  );
                } else {
                  return LinearProgressIndicator();
                }
              },
            )));
    throw UnimplementedError();
  }
}
