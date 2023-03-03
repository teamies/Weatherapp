
import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:my_weather/home.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff123EB9),leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
              Navigator.pop(context);
            }, 
            icon: Icon(Icons.arrow_back_outlined)) ,
          title: Center(
            child: Column(
              children: [
                MyText.baseText(text: 'Cài đặt đơn vị')
              ],
            ),
          ),
        ),
        body: Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
          // color: Colors.blue.shade200,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(0xff123EB9),
                Color(0xFF42A5F5),
              ], // Gradient from https://learnui.design/tools/gradient-generator.html
              tileMode: TileMode.mirror,
            ),
          ),
          child: Column(
            children: [temperature(), rain(), windspeed(), pressure(),
              Container(
                margin: EdgeInsets.only(top: 150),
                child: TextButton(
                  onPressed: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                    Navigator.pushNamed(context, '/');
                  }, 
                  child: Container(
                    padding: const EdgeInsets.only(top: 5, bottom: 5, left: 40, right: 40),
                    child: MyText.baseText(text: 'OK')),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
                    backgroundColor:  MaterialStateProperty.all<Color>(Color.fromARGB(255, 2, 16, 97)),),
                ),
              )
            ],
            ),
        ));
  }

  Widget temperature() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  padding: EdgeInsets.only(right: 15),
                  child: FaIcon(
                    FontAwesomeIcons.temperatureLow,
                    size: 30,
                    color: Colors.white,
                  )),
              MyText.baseText(text: 'Nhiệt độ')
            ],
          ),
          AnimatedButtonBar(
            radius: 8.0,
            padding: const EdgeInsets.all(16.0),
            innerVerticalPadding: 7,
            invertedSelection: true,
            backgroundColor: Color.fromARGB(255, 16, 4, 59).withOpacity(0.6),
            foregroundColor: Colors.white,
            children: [
              ButtonBarEntry(
                  onTap: () => print('First item tapped'),
                  child: MyText.baseText(text: 'F')),
              ButtonBarEntry(
                  onTap: () {
                    print('Second item tapped');
                  },
                  child: MyText.baseText(text: 'C')),
            ],
          ),
        ],
      ),
    );
  }

  Widget rain() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              // Image.asset('assets/img/imgweather/temp.png',width: 40,height: 40,),
              Container(
                  padding: EdgeInsets.only(right: 15),
                  child: FaIcon(
                    FontAwesomeIcons.cloudRain,
                    size: 30,
                    color: Colors.white,
                  )),
              MyText.baseText(text: 'C')
            ],
          ),
          AnimatedButtonBar(
            radius: 8.0,
            padding: const EdgeInsets.all(16.0),
            innerVerticalPadding: 7,
            invertedSelection: true,
            backgroundColor: Color.fromARGB(255, 16, 4, 59).withOpacity(0.6),
            foregroundColor: Colors.white,
            children: [
              ButtonBarEntry(
                  onTap: () => print('First item tapped'),
                  child: MyText.baseText(text: 'mm')),
              ButtonBarEntry(
                  onTap: () => print('Second item tapped'),
                  child: MyText.baseText(text: 'in')),
            ],
          ),
        ],
      ),
    );
  }

  Widget windspeed() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              // Image.asset('assets/img/imgweather/temp.png',width: 40,height: 40,),
              Container(
                  padding: EdgeInsets.only(right: 15),
                  child: FaIcon(
                    FontAwesomeIcons.wind,
                    size: 30,
                    color: Colors.white,
                  )),
              MyText.baseText(text: 'Tốc độ gió')
            ],
          ),
          AnimatedButtonBar(
            radius: 8.0,
            padding: const EdgeInsets.all(16.0),
            innerVerticalPadding: 7,
            invertedSelection: true,
            backgroundColor: Color.fromARGB(255, 16, 4, 59).withOpacity(0.6),
            foregroundColor: Colors.white,
            children: [
              ButtonBarEntry(
                  onTap: () => print('First item tapped'),
                  child: MyText.baseText(text: 'km/h')),
              ButtonBarEntry(
                  onTap: () => print('Second item tapped'),
                  child: MyText.baseText(text: 'm/s')),
            ],
          ),
        ],
      ),
    );
  }


  Widget pressure() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              // Image.asset('assets/img/imgweather/temp.png',width: 40,height: 40,),
              Container(
                padding: EdgeInsets.only(right: 15),
                child:                   
                  Icon(Icons.disabled_visible_outlined, size: 30, color: Colors.white,),
              ),
              MyText.baseText(text: 'Áp suất')
            ],
          ),
          AnimatedButtonBar(
            radius: 8.0,
            padding: const EdgeInsets.all(16.0),
            innerVerticalPadding: 7,
            invertedSelection: true,
            backgroundColor: Color.fromARGB(255, 16, 4, 59).withOpacity(0.6),
            foregroundColor: Colors.white,
            children: [
              ButtonBarEntry(
                  onTap: () => print('First item tapped'),
                  child: MyText.baseText(text: 'mmHg')),
              ButtonBarEntry(
                  onTap: () => print('Second item tapped'),
                  child: MyText.baseText(text: 'hPa')),
              ButtonBarEntry(
                  onTap: () => print('third item tapped'),
                  child: MyText.baseText(text: 'mba')),
            ],
          ),
        ],
      ),
    );
  }
}
