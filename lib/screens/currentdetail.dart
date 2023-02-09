import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_weather/Models/currentweather.dart';
import 'package:my_weather/Models/daily.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:my_weather/core/_config.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CurrentDetail extends StatelessWidget {
  late CurrentWeather currentWeather;
  final List<Daily> dailyWeather;
  CurrentDetail({required this.currentWeather, required this.dailyWeather});
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 800,
      padding: EdgeInsets.only(top: 25, bottom: 25),
      child: Column(
        children: [timeMain(), humidity(), uvi(), windPressure()],
      ),
    );
    throw UnimplementedError();
  }

  Widget timeMain() {
    return Container(
      margin: EdgeInsets.only(bottom: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          timeSun(
              sunset: true,
              text: 'Mặt trời mọc',
              time: this.currentWeather.sunrise),
          SizedBox(
            width: 10,
          ),
          timeSun(
              sunset: true,
              text: 'Mặt trời lặn',
              time: this.currentWeather.sunset)
        ],
      ),
    );
  }

  /**
   * Style widget cho giờ mặt trời mọc và lặn
   */
  Widget timeSun({
    bool sunset = true,
    String? text,
    int? time,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
            borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Image.asset(
              'assets/img/imgweather/${(sunset) ? 'sunset.png' : 'sunrise'}',
              width: 50,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText.baseText(text: text!, size: 14),
                  MyText.hourText(text: time!)
                ],
              )
            ),
          ]
        ),
      )
    );
  }

  Widget humidity() {
    return Container(
      margin: EdgeInsets.only(bottom: 35),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 250,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    MyText.baseText(text: 'Độ ẩm'),
                    Container(
                        height: 150,
                        margin: EdgeInsets.only(top: 15),
                        child: SfRadialGauge(axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 0,
                              maximum: 100,
                              //     showLabels: false,
                              // showAxisLine:false,
                              showTicks: false,
                              axisLabelStyle:
                                  GaugeTextStyle(color: Colors.blue.shade400),
                              // useRangeColorForAxis: true,
                              ranges: <GaugeRange>[
                                GaugeRange(
                                  startValue: 0,
                                  endValue: 100,
                                  // color: Colors.amber,
                                  gradient: SweepGradient(colors: [
                                    Colors.blue.shade100,
                                    Colors.blue.shade300,
                                    Colors.blue.shade400,
                                    Colors.blue.shade700,
                                  ]),
                                ),
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(
                                  value:
                                      this.currentWeather.humidity.toDouble(),
                                  needleColor: Colors.blue.shade400,
                                  needleLength: 0.8,
                                  needleEndWidth: 2.5,
                                  knobStyle: KnobStyle(
                                      knobRadius: 0,
                                      sizeUnit: GaugeSizeUnit.logicalPixel,
                                      color: Colors.blue.shade400),
                                  enableAnimation: true,
                                )
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    widget: Container(
                                        child: MyText.baseText(
                                            text: this
                                                    .currentWeather
                                                    .humidity
                                                    .toString() +
                                                " %",
                                            color: colorblueShade400)),
                                    angle: 90,
                                    positionFactor: 0.5)
                              ])
                        ])),
                  ],
                )),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              height: 250,
              // height: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
                borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  iconAndText(
                    mainAxisAlignment: MainAxisAlignment.start,
                    icon: FontAwesomeIcons.cloud,
                    lable: 'Mây che phủ',
                    value: this.currentWeather.clouds.toString() + "%"),
                  // SizedBox(
                  //   height: 8,
                  // ),
                  iconAndText(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    icon: FontAwesomeIcons.droplet,
                    lable: 'Lượng mưa',
                    value: '20m'),
                  iconAndText(
                    mainAxisAlignment: MainAxisAlignment.start,
                    icon: FontAwesomeIcons.eye,
                    lable:
                        'Dự báo ' + this.currentWeather.clouds.toString() +'mm',
                    value: "Trong 24h tới")
                ],
              ),
            )
          ),
        ],
      ),
    );
  }

  Widget uvi() {
    return Container(
        margin: EdgeInsets.only(bottom: 35),
        child: Row(children: [
          Expanded(
              child: Container(
                  height: 230,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText.baseText(text: 'Chỉ số tia cực tím'),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MyText.baseText(
                                        text:
                                            this.currentWeather.uvi.toString()),
                                  ),
                                  UVCondition(
                                      this.currentWeather.uvi.toDouble()),
                                ],
                              ),
                            ]),
                      ]))),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: Container(
            height: 230,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                iconAndText(
                    mainAxisAlignment: MainAxisAlignment.start,
                    icon: FontAwesomeIcons.temperatureEmpty,
                    lable: 'Nhiệt độ khí quyển',
                    value: this.currentWeather.dewPoint.toStringAsFixed(0) +
                        "\u00b0"),
                iconAndText(
                    mainAxisAlignment: MainAxisAlignment.end,
                    icon: FontAwesomeIcons.eye,
                    lable: 'Tầm Nhìn',
                    value: this.currentWeather.visibility.toString() + "m"),
                iconAndText(
                    mainAxisAlignment: MainAxisAlignment.start,
                    icon: FontAwesomeIcons.moon,
                    lable: 'Dáng trăng',
                    value: this.dailyWeather[0].moonPhase)
              ],
            ),
          )),
        ]));
  }

  Widget windPressure() {
    return Container(
        margin: const EdgeInsets.only(bottom: 35),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Container(
              height: 30,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.white))),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [MyText.baseText(text: 'Gió và áp suất')],
              ),
            ),
            Container(
              height: 130,
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    FontAwesomeIcons.wind,
                    size: 100,
                    color: Colors.white,
                  ),
                  Column(
                    children: [
                      MyText.baseText(
                          text: this.currentWeather.windDeg.toString()),
                      MyText.baseText(
                          text:
                              this.currentWeather.windSpeed.toString() + ' m/s')
                    ],
                  ),
                  // ignore: prefer_const_constructors
                  Spacer(
                    flex: 1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyText.baseText(text: 'Áp suất'),
                      MyText.baseText(
                          text:
                              this.currentWeather.pressure.toString() + " hPa")
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

   Widget iconAndText(
      {MainAxisAlignment? mainAxisAlignment,
      CrossAxisAlignment? crossAxisAlignment,
      IconData? icon,
      String? lable,
      String? value}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: mainAxisAlignment!,
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
      ),
    );
  }

  static UVCondition(num uvi) {
    if (uvi >= 0 && uvi <= 2) {
      return Container(
        width: 175,
        padding: EdgeInsets.only(top: 15, bottom: 20),
        child: Column(
          children: [
            MyText.baseText(text: 'Thấp'),
          ],
        ),
      );
    } else if (2 < uvi && uvi <= 7) {
      return Container(
        width: 175,
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            MyText.baseText(text: 'Cao'),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    MyText.baseText(text: 'Cần ở trong bóng râm vào giữa trưa'))
          ],
        ),
      );
    } else if (7 < uvi && uvi < 11) {
      return Container(
        width: 160,
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            MyText.baseText(text: 'Rất cao'),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyText.baseText(text: 'Tránh ra ngoài vào giữa trưa'))
          ],
        ),
      );
    } else if (uvi >= 11) {
      return Container(
        width: 160,
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            MyText.baseText(text: 'Cực kỳ cao'),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyText.baseText(
                    text: 'rất nguy hiểm, nguy cơ làm tổn thương da, mắt'))
          ],
        ),
      );
    }
    return uvi;
  }
}
