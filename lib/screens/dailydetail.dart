import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:my_weather/Models/daily.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:my_weather/components/myweatherimg.dart';
import 'package:my_weather/core/convert.dart';
import 'package:my_weather/core/icon.dart';

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
    final  date = ((DateTime.now().millisecondsSinceEpoch)/1000).toInt();
    //  final date = 1676293200;
    bool checkDay = date > (this.widget.daily[0].sunrise) && date < (this.widget.daily[0].sunset);
    List<Tab> tabs = [];
    for (int i = 0; i < 8; i++) {
      tabs.add(Tab(
          child: Column(
        children: [
          MyText.dayText(text: this.widget.daily[i].dt),
          Expanded(
              child: getIconPlatForm(checkDay, this.widget.daily[i].weather[0].description)
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
    for (int i = 0; i < 8; i++) {

       final List<dynamic> _menulist = [
      {'lable': 'Cảm giác thực', 'icon': FontAwesomeIcons.temperatureHalf, 'value': this.widget.daily[i].feelsLike.day.toStringAsFixed(0)+"\u00B0"},
      {'lable': 'Nhiệt độ thấp nhất', 'icon': FontAwesomeIcons.temperatureArrowDown, 'value': this.widget.daily[i].temp.min.toStringAsFixed(0)+"\u00B0"},
      {'lable': 'Nhiệt độ cao nhất', 'icon': FontAwesomeIcons.temperatureArrowUp, 'value': this.widget.daily[i].temp.max.toStringAsFixed(0)+"\u00B0"},
      {'lable': 'Nhiệt độ khí quyển', 'icon': FontAwesomeIcons.temperatureEmpty, 'value':this.widget.daily[i].dewPoint.toStringAsFixed(0)+"\u00B0"},
      // {'lable': 'Tầm nhìn', 'icon': FontAwesomeIcons.eye, 'value': this.widget.daily[i].visibility. toString() +'m'},
      {'lable': 'Áp suất khí quyển ', 'icon': FontAwesomeIcons.eye, 'value': this.widget.daily[i].pressure. toString() +'hPa'},
      {'lable': 'Mây che phủ', 'icon': FontAwesomeIcons.cloud, 'value': this.widget.daily[i].clouds. toString()+'%'},
      {'lable': 'Bình minh', 'icon': FontAwesomeIcons.sun, 'value': DateFormat.Hm() .format(DateTime.fromMillisecondsSinceEpoch(this.widget.daily[i].sunrise * 1000))
          .toString()},
      {'lable': 'Hoàng hôn', 'icon': FontAwesomeIcons.sun, 'value':DateFormat.Hm() .format(DateTime.fromMillisecondsSinceEpoch(this.widget.daily[i].sunset * 1000))
          .toString()},
      {'lable': 'Trăng mọc', 'icon': FontAwesomeIcons.moon, 'value':DateFormat.Hm() .format(DateTime.fromMillisecondsSinceEpoch(this.widget.daily[i].moonrise * 1000))
          .toString()},
      {'lable': 'Trăng lặn', 'icon': FontAwesomeIcons.moon, 'value': DateFormat.Hm() .format(DateTime.fromMillisecondsSinceEpoch(this.widget.daily[i].moonset * 1000))
          .toString()},

      {'lable': 'Mức độ tia cực tím', 'icon': FontAwesomeIcons.sun, 'value': UVCondition(this.widget.daily[i].uvi)},
      {'lable': 'Chỉ số tia cực tím', 'icon': FontAwesomeIcons.usersViewfinder, 'value': this.widget.daily[i].uvi. toString()},
      {'lable': 'Tốc độ gió', 'icon':FontAwesomeIcons.wineGlass, 'value': this.widget.daily[i].windSpeed. toString()+'m/s'},
      {'lable': 'Sức gió tối đa', 'icon': FontAwesomeIcons.wind, 'value': this.widget.daily[i].windGust. toString()+'m/s'},
      {'lable': 'Hướng gió', 'icon': FontAwesomeIcons.compass, 'value': this.widget.daily[i].windDeg. toString()},
      {'lable': 'Lượng Mưa', 'icon': FontAwesomeIcons.cloudShowersHeavy, 'value':  this.widget.daily[i].rain. toString()+"mm"},
      {'lable': 'Xác suất mưa', 'icon':FontAwesomeIcons.compass, 'value':  (this.widget.daily[i].pop* 100).toString() +'%'},
      {'lable': 'Khả năng tuyết', 'icon':FontAwesomeIcons.snowman, 'value': '0'},
      {'lable': 'Tuyết', 'icon': FontAwesomeIcons.snowflake, 'value': '0'},
      {'lable': 'Khả năng mưa đá', 'icon':FontAwesomeIcons.cloudRain, 'value': '0'},
      {'lable': 'mưa đá', 'icon': FontAwesomeIcons.cloudRain, 'value': '0'},

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
                            icon: getIconPlatForm(checkDay, this.widget.daily[i].weather[0].description),
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
                // mainAxisSpacing: 1,
                childAspectRatio: 2.0,
                children: List.generate(
                  _menulist.length,
                  (index) {
                    return Container(
                      margin: EdgeInsets.all(15),
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
      Widget? icon ,
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
        title: const Text('Thời tiết theo ngày'),
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
