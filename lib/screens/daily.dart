import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;
import 'package:my_weather/Models/daily.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:my_weather/components/myweatherimg.dart';
import 'package:my_weather/core/icon.dart';
import 'package:my_weather/screens/dailydetail.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class DailyScreen extends StatelessWidget {
  final List<Daily> daily;
  double? miny,maxy;
  DailyScreen({required this.daily});
  List<Color> gradientColors = [
    Color.fromARGB(255, 25, 118, 210),
    Color.fromARGB(255, 25, 118, 210),
    // Color.fromARGB(255, 153, 16, 158),
  ];

  List<Color> gradientColorsmax = [
    Colors.red,
    Colors.red,
  ];
  // bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    
    miny = [
      this.daily[0].temp.min,
      this.daily[1].temp.min,
      this.daily[2].temp.min,
      this.daily[3].temp.min,
      this.daily[4].temp.min,
      this.daily[5].temp.min,
      this.daily[6].temp.min,
      this.daily[7].temp.min,
    ].reduce(math.min) -
    5;
    // maxy = [
    //   this.daily[0].temp.max,
    //   this.daily[1].temp.max,
    //   this.daily[2].temp.max,
    //   this.daily[3].temp.max,
    //   this.daily[4].temp.max,
    //   this.daily[5].temp.max,
    //   this.daily[6].temp.max,
    //   this.daily[7].temp.max,
    // ].reduce(math.max) +
    // 5;

    print(maxy);
    print(this.daily[0].dt);
    print(this.daily[1].dt);
    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 1, child: MyText.baseText(text: 'Dự báo theo ngày')),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    SwipeablePageRoute(
                        builder: (context) => DailyDetail(
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
          margin: EdgeInsets.only(bottom: 35),
          child: Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.70,
                child: Container(
                  decoration: BoxDecoration(
                      color:
                          Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20)),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 600,
                        padding: const EdgeInsets.only(
                          right: 40,
                          left: 40,
                          top: 24,
                          bottom: 12,
                        ),
                        child: LineChart(LineChartData(
                          lineTouchData: LineTouchData(enabled: false),
                          gridData: FlGridData(
                            show: false,
                            drawVerticalLine: true,
                            horizontalInterval: 1,
                            verticalInterval: 1,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: Color.fromARGB(255, 55, 77, 65),
                                strokeWidth: 1,
                              );
                            },
                            getDrawingVerticalLine: (value) {
                              return FlLine(
                                color: const Color(0xff37434d),
                                strokeWidth: 1,
                              );
                            },
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 120,
                                interval: 1,
                                getTitlesWidget: topTitleWidgets,
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                                // interval: 1,
                                // getTitlesWidget: leftTitleWidgets,
                                // reservedSize: 42,
                              ),
                            ),
                          ),
                          borderData: FlBorderData(
                            show: false,
                            border:
                                Border.all(color: const Color(0xff37434d)),
                          ),
                          minX: 0,
                          maxX: 7,
                          minY: miny,
                          maxY: maxy,
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0,this.daily[0].temp.max),
                                FlSpot(1,this.daily[1].temp.max),
                                FlSpot(2,this.daily[2].temp.max),
                                FlSpot(3,this.daily[3].temp.max),
                                FlSpot(4,this.daily[4].temp.max),
                                FlSpot(5,this.daily[5].temp.max),
                                FlSpot(6,this.daily[6].temp.max),
                                FlSpot(7,this.daily[7].temp.max),
                              ],
                              curveSmoothness: 0,
                              isCurved: true,
                              gradient: LinearGradient(
                                colors: gradientColorsmax,
                              ),
                              barWidth: 5,
                              isStrokeCapRound: true,
                              dotData: FlDotData(
                                show: true,
                              ),
                              belowBarData: BarAreaData(
                                show: true,
                                gradient: LinearGradient(
                                  colors: gradientColorsmax
                                      .map(
                                          (color) => color.withOpacity(0.3))
                                      .toList(),
                                ),
                              ),
                            ),
                            LineChartBarData(
                              spots: [
                                FlSpot(-0.5,this.daily[0].temp.max),
                                FlSpot(0,this.daily[0].temp.max),
                              ],
                              curveSmoothness: 0,
                              isCurved: true,
                              gradient: LinearGradient(
                                colors: gradientColorsmax,
                              ),
                              barWidth: 5,
                              isStrokeCapRound: true,
                              dotData: FlDotData(
                                show: false,
                              ),
                              belowBarData: BarAreaData(
                                show: true,
                                gradient: LinearGradient(
                                  colors: gradientColorsmax
                                      .map(
                                          (color) => color.withOpacity(0.3))
                                      .toList(),
                                ),
                              ),
                            ),
                            LineChartBarData(
                              spots: [
                                FlSpot(7,this.daily[7].temp.max),
                                FlSpot(7.5,this.daily[7].temp.max),
                              ],
                              curveSmoothness: 0,
                              isCurved: true,
                              gradient: LinearGradient(
                                colors: gradientColorsmax,
                              ),
                              barWidth: 5,
                              isStrokeCapRound: true,
                              dotData: FlDotData(
                                show: false,
                              ),
                              belowBarData: BarAreaData(
                                show: true,
                                gradient: LinearGradient(
                                  colors: gradientColorsmax
                                      .map(
                                          (color) => color.withOpacity(0.3))
                                      .toList(),
                                ),
                              ),
                            ),
                            LineChartBarData(
                              spots: [
                                FlSpot(0,this.daily[0].temp.min),
                                FlSpot(1,this.daily[1].temp.min),
                                FlSpot(2,this.daily[2].temp.min),
                                FlSpot(3,this.daily[3].temp.min),
                                FlSpot(4,this.daily[4].temp.min),
                                FlSpot(5,this.daily[5].temp.min),
                                FlSpot(6,this.daily[6].temp.min),
                                FlSpot(7,this.daily[7].temp.min),
                              ],
                              isCurved: true,
                              curveSmoothness: 0,
                              gradient: LinearGradient(
                                colors: gradientColors,
                              ),
                              barWidth: 5,
                              isStrokeCapRound: true,
                              dotData: FlDotData(
                                show: true,
                              ),
                              belowBarData: BarAreaData(
                                show: true,
                                gradient: LinearGradient(
                                  colors: gradientColors
                                      .map(
                                          (color) => color.withOpacity(0.7))
                                      .toList(),
                                ),
                              ),
                            ),
                            LineChartBarData(
                              spots: [
                                FlSpot(-0.5,this.daily[0].temp.min),
                                FlSpot(0,this.daily[0].temp.min),
                              ],
                              isCurved: true,
                              curveSmoothness: 0,
                              gradient: LinearGradient(
                                colors: gradientColors,
                              ),
                              barWidth: 5,
                              isStrokeCapRound: true,
                              dotData: FlDotData(
                                show: false,
                              ),
                              belowBarData: BarAreaData(
                                show: true,
                                gradient: LinearGradient(
                                  colors: gradientColors
                                      .map(
                                          (color) => color.withOpacity(0.7))
                                      .toList(),
                                ),
                              ),
                            ),
                            LineChartBarData(
                              spots: [
                                FlSpot(7,this.daily[7].temp.min),
                                FlSpot(7.5,this.daily[7].temp.min),
                              ],
                              isCurved: true,
                              curveSmoothness: 0,
                              gradient: LinearGradient(
                                colors: gradientColors,
                              ),
                              barWidth: 5,
                              isStrokeCapRound: true,
                              dotData: FlDotData(
                                show: false,
                              ),
                              belowBarData: BarAreaData(
                                show: true,
                                gradient: LinearGradient(
                                  colors: gradientColors
                                      .map(
                                          (color) => color.withOpacity(0.7))
                                      .toList(),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              //
            ],
          ),
        ),
      ],
    );
  }

  Widget topTitleWidgets(double value, TitleMeta meta) {
    // bool checkDay = true;
    final  date = ((DateTime.now().millisecondsSinceEpoch)/1000).toInt();
    // final date = 1676293200;
    bool checkDay = date > (this.daily[0].sunrise) && date < (this.daily[0].sunset);
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Column(
          children: [
            MyText.baseText(text:  DateFormat.E('vi').format(DateTime.now())),
            MyText.dayText(text: this.daily[0].dt),
            // Container(
            //   width: 40,
            //   height: 40,
            //   child:
            //    MyWeatherImg(
            //     name: this.daily[0].weather[0].icon,
            //   )
            //   getIconPlatForm(check, this.daily[0].weather[0].description)
            // ),
            imgweather(getIconPlatForm(checkDay, this.daily[0].weather[0].description))
          ],
        );
        break;
      case 1:
        text = Column(
          children: [
           MyText.baseText(text:  DateFormat.E('vi').format(DateTime.now().add(Duration(days: 1)))),
            MyText.dayText(text: this.daily[1].dt),
            imgweather(getIconPlatForm(checkDay, this.daily[1].weather[0].description))
          ],
        );
        break;
      case 2:
        text = Column(
          children: [
            MyText.baseText(text:  DateFormat.E('vi').format(DateTime.now().add(Duration(days: 2)))),
            MyText.dayText(text: this.daily[2].dt),
            imgweather(getIconPlatForm(checkDay, this.daily[2].weather[0].description))
          ],
        );
        break;
      case 3:
        text = Column(
          children: [
            MyText.baseText(text:  DateFormat.E('vi').format(DateTime.now().add(Duration(days: 3)))),
            MyText.dayText(text: this.daily[3].dt),
           imgweather(getIconPlatForm(checkDay, this.daily[3].weather[0].description))
          ],
        );
        break;
      case 4:
        text = Column(
          children: [
            MyText.baseText(text:  DateFormat.E('vi').format(DateTime.now().add(Duration(days: 4)))),
            MyText.dayText(text: this.daily[4].dt),
            imgweather(getIconPlatForm(checkDay, this.daily[4].weather[0].description))
          ],
        );
        break;
      case 5:
        text = Column(
          children: [
            MyText.baseText(text:  DateFormat.E('vi').format(DateTime.now().add(Duration(days: 5)))),
            MyText.dayText(text: this.daily[5].dt),
            imgweather(getIconPlatForm(checkDay, this.daily[5].weather[0].description))
          ],
        );
        break;
      case 6:
        text = Column(
          children: [
            MyText.baseText(text:  DateFormat.E('vi').format(DateTime.now().add(Duration(days: 6)))),
            MyText.dayText(text: this.daily[6].dt),
            imgweather(getIconPlatForm(checkDay, this.daily[6].weather[0].description))
          ],
        );
        break;
      case 7:
        text = Column(
          children: [
            MyText.baseText(text:  DateFormat.E('vi').format(DateTime.now().add(Duration(days: 7)))),
            MyText.dayText(text: this.daily[7].dt),
            imgweather(getIconPlatForm(checkDay, this.daily[7].weather[0].description))
          ],
        );
        break;
      default:
        text = Text(DateFormat.d().format(DateTime.now()));
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget imgweather(Widget img){
    return Container(
              margin: EdgeInsets.only( top: 10),
              width: 40,
              height: 40,
              child: 
              // MyWeatherImg(
              //   name: this.daily[2].weather[0].icon,
              // )
              img
            );
  }
}