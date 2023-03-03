import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_weather/Models/currentweather.dart';
import 'package:my_weather/Models/daily.dart';
import 'package:my_weather/Models/feelslike.dart';
import 'package:my_weather/Models/hourly.dart';
import 'package:my_weather/components/myicon.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:my_weather/components/myweatherimg.dart';
import 'package:my_weather/core/convert.dart';
import 'package:my_weather/core/icon.dart';

class HourlyDetail extends StatefulWidget {
  late List<Hourly> hourly;
  // final CurrentWeather weather;
  final List<Daily> daily;
  HourlyDetail({required this.hourly,  required this.daily});

  @override
  State<HourlyDetail> createState() => _HourlyDetailState();
}

class _HourlyDetailState extends State<HourlyDetail>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 24, vsync: this);
  }

  List<Tab> createTabs() {
    final  date = ((DateTime.now().millisecondsSinceEpoch)/1000).toInt();
    //  final date = 1676293200;
    // bool checkDay = date > (this.widget.weather.sunrise) && date < (this.widget.weather.sunset);
    List<Tab> tabs = [];
    for (int i = 0; i < 24; i++) {
      bool checkDay = ((this.widget.hourly[i].dt) > (this.widget.daily[0].sunrise) && (this.widget.hourly[i].dt) < (this.widget.daily[0].sunset)) || ((this.widget.hourly[i].dt) > (this.widget.daily[1].sunrise) && (this.widget.hourly[i].dt) < (this.widget.daily[1].sunset)) ;
      tabs.add(Tab(
          child: Column(
        children: [
          MyText.hourText(text: this.widget.hourly[i].dt),
          Expanded(
            child: getIconPlatForm(checkDay, this.widget.hourly[i].weather[0].description)
            // MyWeatherImg(
            //   name: this.widget.hourly[i].weather[0].icon,
            // )
          )
        ],
      )));
    }
    return tabs;
  }

  
  List<Widget> createTabBarView() {
    final  date = ((DateTime.now().millisecondsSinceEpoch)/1000).toInt();
    //  final date = 1676293200;
    bool checkDay = date > (this.widget.daily[0].sunrise) && date < (this.widget.daily[0].sunset);
    List<Widget> tabs = [];
    for (int i = 0; i < 24; i++) {

      final List<dynamic> _menu = [
      {'lable': 'Cảm giác thực', 'icon': FontAwesomeIcons.temperatureHalf, 'value': this.widget.hourly[i].feelsLike.toStringAsFixed(0)+"\u00B0"},
      {'lable': 'Nhiệt độ khí quyển', 'icon': FontAwesomeIcons.temperatureEmpty, 'value':this.widget.hourly[i].dewPoint.toStringAsFixed(0)+"\u00B0"},
      {'lable': 'Tầm nhìn', 'icon': FontAwesomeIcons.eye, 'value': this.widget.hourly[i].visibility. toString() +'m'},
      {'lable': 'Áp suất khí quyển ', 'icon': FontAwesomeIcons.eye, 'value': this.widget.hourly[i].pressure. toString() +'hPa'},
      {'lable': 'Mây che phủ', 'icon': FontAwesomeIcons.cloud, 'value': this.widget.hourly[i].clouds. toString()+'%'},
      {'lable': 'Mức độ tia cực tím', 'icon': FontAwesomeIcons.sun, 'value': UVCondition(this.widget.hourly[i].uvi)},
      {'lable': 'Chỉ số tia cực tím', 'icon': FontAwesomeIcons.usersViewfinder, 'value': this.widget.hourly[i].uvi. toString()},
      {'lable': 'Tốc độ gió', 'icon':FontAwesomeIcons.wineGlass, 'value': this.widget.hourly[i].windSpeed. toString()+'m/s'},
      {'lable': 'Sức gió tối đa', 'icon': FontAwesomeIcons.wind, 'value': this.widget.hourly[i].windGust. toString()+'m/s'},
      {'lable': 'Hướng gió', 'icon': FontAwesomeIcons.compass, 'value': this.widget.hourly[i].windDeg. toString()},
      {'lable': 'Lượng Mưa', 'icon': FontAwesomeIcons.cloudShowersHeavy, 'value':  (this.widget.hourly[i].rain != null) ? this.widget.hourly[i].rain!.oneHour.toString() +' mm' : "0 mm"},
      {'lable': 'Xác suất mưa', 'icon':FontAwesomeIcons.compass, 'value':  (this.widget.hourly[i].pop* 100).toString() +'%'},
      {'lable': 'Khả năng tuyết', 'icon':FontAwesomeIcons.snowman, 'value': '0 %'},
      {'lable': 'Tuyết', 'icon': FontAwesomeIcons.snowflake, 'value': '0'},
      // {'lable': 'Khả năng mưa đá', 'icon':FontAwesomeIcons.cloudRain, 'value': 'null'},
      // {'lable': 'mưa đá', 'icon': FontAwesomeIcons.cloudRain, 'value': 'null'},
      ];
      tabs.add(Container(
        decoration: BoxDecoration(
          // color: Colors.black26
          color: Color.fromARGB(255, 16, 4, 59).withOpacity(0.3),
          ),
        child:
          CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      // color: Colors.blueAccent,
                      height: 250,
                      child: MyHeader(
                          date: this.widget.hourly[i].dt,
                          temp: this.widget.hourly[i].temp,
                          icon:getIconPlatForm(checkDay, this.widget.hourly[i].weather[0].description),
                          description: this.widget.hourly[i].weather[0].description,
                          humidity: this.widget.hourly[i].humidity),
                    );
                  },
                  childCount: 1,
                ),
              ),
              SliverGrid.count(
                crossAxisCount: 2,
                // crossAxisSpacing: 5,
                mainAxisSpacing: 6,
                childAspectRatio: 2,
                children: List.generate(
                  _menu.length,
                  (index) {
                    return Container(
                      margin: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width / 2.0,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            iconAndText(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                 icon: _menu[index]['icon'],
                              lable: _menu[index]['lable'],
                              value: _menu[index]['value'].toString()),
                          ],
                        ),
                      
                    );
                  },
                ),
              )
            ],
          )
        )
      );
    }
    return tabs;
  }

  /**
   * Header tab view
   */

  Widget MyHeader(
      {int? date,
      dynamic temp,
      Widget? icon ,
      String? description,
      dynamic humidity}) {
    return Container(
      margin: EdgeInsets.all(20),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        // color: Colors.black26
        color: Color.fromARGB(255, 16, 4, 59).withOpacity(0.3),
        ),
      child: Column(children: [
        MyText.date(text: date!, size: 15, fontWeight: FontWeight.w300),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              height: 60,
              child: icon,
            ),
            MyText.temp(temp: temp)
          ],
        ),
        MyText.baseText(text: 'Độ ẩm tương đối: ${humidity}%'),
        MyText.baseText(text: description!),
      ]),
    );
  }


  Widget iconAndText(
      {MainAxisAlignment? mainAxisAlignment,
      IconData? icon,
      String? lable,
      String? value}) {
    return Row(
      mainAxisAlignment: mainAxisAlignment!,
      children: [
        FaIcon(
          icon,
          size: 20,
          color: Colors.white,
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            children: [
              MyText.baseText(text: lable!, size: 16, textAlign: TextAlign.center),
              MyText.baseText(text: value!, size: 16)
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thời tiết theo giờ'),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          padding: EdgeInsets.only(bottom: 10),
          tabs: createTabs(),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/img/imgThienNhien1.jpg"))),
        child: TabBarView(
            controller: _tabController, children: createTabBarView()),
      ),
    );
  }
}
