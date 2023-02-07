import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_weather/Models/feelslike.dart';
import 'package:my_weather/Models/hourly.dart';
import 'package:my_weather/components/myicon.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:my_weather/components/myweatherimg.dart';

class HourlyDetail extends StatefulWidget {
  late List<Hourly> hourly;
  HourlyDetail({required this.hourly});

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
    List<Tab> tabs = [];
    for (int i = 0; i < 24; i++) {
      tabs.add(Tab(
          child: Column(
        children: [
          MyText.hourText(text: this.widget.hourly[i].dt),
          Expanded(
              child: MyWeatherImg(
            name: this.widget.hourly[i].weather[0].icon,
          ))
        ],
      )));
    }
    return tabs;
  }

  
  List<Widget> createTabBarView() {
    List<Widget> tabs = [];
    for (int i = 0; i < 24; i++) {

      final List<dynamic> _menu = [
      {'lable': 'Cảm giác thực', 'icon': FontAwesomeIcons.temperatureHalf, 'value': this.widget.hourly[i].feelsLike.toStringAsFixed(0)+"\u00B0"},
      {'lable': 'Nhiệt độ khí quyển', 'icon': FontAwesomeIcons.temperatureEmpty, 'value':this.widget.hourly[i].dewPoint.toStringAsFixed(0)+"\u00B0"},
      {'lable': 'Tầm nhìn', 'icon': FontAwesomeIcons.eye, 'value': this.widget.hourly[i].visibility. toString() +'m'},
      {'lable': 'Áp suất khí quyển ', 'icon': FontAwesomeIcons.eye, 'value': this.widget.hourly[i].pressure. toString() +'hPa'},
      {'lable': 'Mây che phủ', 'icon': FontAwesomeIcons.cloud, 'value': this.widget.hourly[i].clouds. toString()+'%'},
      {'lable': 'Mức độ tia cực tím', 'icon': FontAwesomeIcons.sun, 'value': this.widget.hourly[i].uvi. toString()},
      {'lable': 'Chỉ số tia cực tím', 'icon': FontAwesomeIcons.usersViewfinder, 'value': this.widget.hourly[i].uvi. toString()},
      {'lable': 'Tốc độ gió', 'icon':FontAwesomeIcons.wineGlass, 'value': this.widget.hourly[i].windSpeed. toString()+'m/s'},
      {'lable': 'Sức gió tối đa', 'icon': FontAwesomeIcons.wind, 'value': this.widget.hourly[i].windGust. toString()+'m/s'},
      {'lable': 'Hướng gió', 'icon': FontAwesomeIcons.compass, 'value': this.widget.hourly[i].clouds. toString()},

      {'lable': 'Lượng Mưa', 'icon': FontAwesomeIcons.cloudShowersHeavy, 'value':  this.widget.hourly[i].clouds. toString()},
      {'lable': 'Xác suất mưa', 'icon':FontAwesomeIcons.compass, 'value':  this.widget.hourly[i].clouds. toString()},
      {'lable': 'Khả năng tuyết', 'icon':FontAwesomeIcons.snowman, 'value':  this.widget.hourly[i].clouds. toString()},
      {'lable': 'Tuyết', 'icon': FontAwesomeIcons.snowflake, 'value': 'null'},
      {'lable': 'Khả năng mưa đá', 'icon':FontAwesomeIcons.cloudRain, 'value': 'null'},
      {'lable': 'mưa đá', 'icon': FontAwesomeIcons.cloudRain, 'value': 'null'},

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
                          icon: this.widget.hourly[i].weather[0].icon,
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
                mainAxisSpacing: 5,
                childAspectRatio: 2.8,
                children: List.generate(
                  _menu.length,
                  (index) {
                    return Container(
                      margin: EdgeInsets.all(20),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          iconAndText(
                              mainAxisAlignment: MainAxisAlignment.start,
                              icon: _menu[index]['icon'],
                              lable: _menu[index]['lable'],
                              value: _menu[index]['value']),
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
      String icon = '',
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
              height: 80,
              child: MyWeatherImg(name: icon),
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
        Column(
          children: [
            MyText.baseText(text: lable!, size: 16),
            MyText.baseText(text: value!, size: 16)
          ],
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
