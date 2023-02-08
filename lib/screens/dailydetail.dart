import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_weather/Models/daily.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:my_weather/components/myweatherimg.dart';

class DailyDetail extends StatefulWidget {
  late List<Daily> daily;
  DailyDetail({required this.daily});

  @override
  State<DailyDetail> createState() => _DailyDetailState();
}

class _DailyDetailState extends State<DailyDetail>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  List<Tab> createTabs() {
    List<Tab> tabs = [];
    for (int i = 0; i < 8; i++) {
      tabs.add(Tab(
          child: Column(
        children: [
          MyText.hourText(text: this.widget.daily[i].dt),
          Expanded(
              child: MyWeatherImg(
            name: this.widget.daily[i].weather[0].icon,
          ))
        ],
      )));
    }
    return tabs;
  }

  List<Widget> createTabBarView() {
    List<Widget> tabs = [];
    for (int i = 0; i < 8; i++) {

       final List<dynamic> _menulist = [
      {'lable': 'Cảm giác thực', 'icon': FontAwesomeIcons.temperatureHalf, 'value': this.widget.daily[i].feelsLike.day.toStringAsFixed(0)+"\u00B0"},
      {'lable': 'Nhiệt độ thấp nhất', 'icon': FontAwesomeIcons.temperatureArrowDown, 'value': this.widget.daily[i].temp.min.toStringAsFixed(0)+"\u00B0"},
      {'lable': 'Nhiệt độ cao nhất', 'icon': FontAwesomeIcons.temperatureArrowUp, 'value': this.widget.daily[i].temp.max.toStringAsFixed(0)+"\u00B0"},
      {'lable': 'Nhiệt độ khí quyển', 'icon': FontAwesomeIcons.temperatureEmpty, 'value':this.widget.daily[i].dewPoint.toStringAsFixed(0)+"\u00B0"},
      // {'lable': 'Tầm nhìn', 'icon': FontAwesomeIcons.eye, 'value': this.widget.daily[i].visibility. toString() +'m'},
      {'lable': 'Áp suất khí quyển ', 'icon': FontAwesomeIcons.eye, 'value': this.widget.daily[i].pressure. toString() +'hPa'},
      {'lable': 'Mây che phủ', 'icon': FontAwesomeIcons.cloud, 'value': this.widget.daily[i].clouds. toString()+'%'},
      {'lable': 'Bình minh', 'icon': FontAwesomeIcons.sun, 'value': this.widget.daily[i].sunrise. toString()},
      {'lable': 'Hoàng hôn', 'icon': FontAwesomeIcons.sun, 'value': this.widget.daily[i].sunset. toString()},
      {'lable': 'Trăng mọc', 'icon': FontAwesomeIcons.moon, 'value': this.widget.daily[i].moonrise. toString()},
      {'lable': 'Trăng lặn', 'icon': FontAwesomeIcons.moon, 'value': this.widget.daily[i].moonset. toString()},

      {'lable': 'Mức độ tia cực tím', 'icon': FontAwesomeIcons.sun, 'value': this.widget.daily[i].uvi. toString()},
      {'lable': 'Chỉ số tia cực tím', 'icon': FontAwesomeIcons.usersViewfinder, 'value': this.widget.daily[i].uvi. toString()},
      {'lable': 'Tốc độ gió', 'icon':FontAwesomeIcons.wineGlass, 'value': this.widget.daily[i].windSpeed. toString()+'m/s'},
      {'lable': 'Sức gió tối đa', 'icon': FontAwesomeIcons.wind, 'value': this.widget.daily[i].windGust. toString()+'m/s'},
      {'lable': 'Hướng gió', 'icon': FontAwesomeIcons.compass, 'value': this.widget.daily[i].clouds. toString()},
      {'lable': 'Lượng Mưa', 'icon': FontAwesomeIcons.cloudShowersHeavy, 'value':  this.widget.daily[i].clouds. toString()},
      {'lable': 'Xác suất mưa', 'icon':FontAwesomeIcons.compass, 'value':  this.widget.daily[i].clouds. toString()},
      {'lable': 'Khả năng tuyết', 'icon':FontAwesomeIcons.snowman, 'value':  this.widget.daily[i].clouds. toString()},
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
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          // color: Colors.blueAccent,
                          height: 250,
                          child: MyHeader(
                            date: this.widget.daily[i].dt,
                            temp: this.widget.daily[i].temp.day,
                            icon: this.widget.daily[i].weather[0].icon,
                            description: this.widget.daily[i].weather[0].description,
                            humidity: this.widget.daily[i].humidity)
                        ),
                      ],
                    );
                  },
                  childCount: 1,
                ),
              ),

              SliverGrid.count(
                crossAxisCount: 2,
                // crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 2.0,
                children: List.generate(
                  _menulist.length,
                  (index) {
                    return Container(
                      margin: EdgeInsets.all(20),
                      width: double.infinity,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            iconAndText(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  icon: _menulist[index]['icon'],
                                  lable: _menulist[index]['lable'],
                                  value: _menulist[index]['value']),
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
      decoration: BoxDecoration(color: Colors.black26),
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
      {
        // MainAxisAlignment? mainAxisAlignment,
      CrossAxisAlignment? crossAxisAlignment,
      IconData? icon,
      String? lable,
      String? value}) {
    return Row(
      // mainAxisAlignment: mainAxisAlignment!,
      crossAxisAlignment: crossAxisAlignment!,
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
              MyText.baseText(text: lable!, size: 16),
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
        title: const Text('Thời tiết theo ngày'),
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
