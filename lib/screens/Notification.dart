import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:my_weather/home.dart';


class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  bool status4 = false;
  bool status5 = false;
  TextEditingController timeinput = TextEditingController();
  @override
  void initState() {
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff123EB9),
          leading: IconButton(
            onPressed: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Home(town: town)));
              Navigator.pop(context);
              Navigator.pop(context);
            }, 
            icon: Icon(Icons.arrow_back_outlined)) ,
          title: Center(
            child: Column(
              children: [
                MyText.baseText(text: 'Cài đặt thông báo')
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

          child: ListView(
            children: [
              Column(
                children: [
                  Notification(),
                  notificationState(),
                ],
              ),
            ],
          ),
        ));
  }

  Widget Notification() {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.only(bottom: 20, top: 20),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.white))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: MyText.baseText(text: "Bật thông báo")
          ),
          FlutterSwitch(
            width: 55,
            height: 30,
            value: status1,
            onToggle: (bool val) {
              setState(() {
                status1 = val;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget notificationState() {
    return AnimatedOpacity(
      opacity: status1 ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 1),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.only(top: 30),
            child: MyText.baseText(text: "Thông báo hàng ngày")
          ),
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.only(bottom: 20, top: 15),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.white))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: MyText.baseText(text:  "Buổi sáng")
                ),
                FlutterSwitch(
                  width: 55,
                  height: 30,
                  value: status2,
                  onToggle: (bool val) {
                    setState(() {
                      status2 = val;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.only(bottom: 20, top: 15),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.white))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: MyText.baseText(text: "Buổi trưa")
                ),
                FlutterSwitch(
                  width: 55,
                  height: 30,
                  value: status3,
                  onToggle: (bool val) {
                    setState(() {
                      status3 = val;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.only(bottom: 20, top: 15),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.white))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: MyText.baseText(text: "Buổi tối")
                ),
                FlutterSwitch(
                  width: 55,
                  height: 30,
                  value: status4,
                  onToggle: (bool val) {
                    setState(() {
                      status4 = val;
                    });
                  },
                ),
              ],
            ),
          ),
          settingTimeNotification()
        ],
      ),
    );
  }

  Widget settingTimeNotification() {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.only(bottom: 20, top: 20),
      // decoration: BoxDecoration(
      //     border: Border(bottom: BorderSide(width: 1, color: Colors.white))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: MyText.baseText(text: "Đặt thời gian")
              ),
              FlutterSwitch(
                width: 55,
                height: 30,
                value: status5,
                onToggle: (bool val) {
                  setState(() {
                    status5 = val;
                  });
                },
              ),
            ],
          ),
          TimePicker()
        ],
      ),
    );
  }

  Widget TimePicker() {
    return AnimatedOpacity(
        opacity: status5 ? 1 : 0,
        duration: Duration(milliseconds: 1),
        child: Container(
            padding: EdgeInsets.all(15),
            height: 250,
            child: Column(
              children: [
                TextField(
                  controller: timeinput,
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        //<-- SEE HERE
                        borderSide: BorderSide(width: 3, color: Colors.white),
                      ),
                      icon: FaIcon(
                        FontAwesomeIcons.clock,
                        color: Colors.white,
                      ),
                      hintText: "Enter Time",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 18)),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  readOnly: true,
                  onTap: () async {
                    print(TimeOfDay.now());
                    TimeOfDay? pickedTime = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );

                    if (pickedTime != null) {
                      print(pickedTime.format(context));
                      setState(() {
                        timeinput.text = pickedTime.format(context).toString();
                      });
                    } else {
                      print("Time is not selected");
                    }
                  },
                ),
              ],
            )));
  }
}
