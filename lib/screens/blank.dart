import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:my_weather/components/myappbartext.dart';
import 'package:my_weather/components/mydrawer.dart';
import 'package:my_weather/components/myicon.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_weather/controller/controller.dart';
import 'package:my_weather/core/_config.dart';
import 'package:my_weather/screens/search.dart';

class Blank extends StatefulWidget {
  @override
  State<Blank> createState() => _BlankState();
}

class _BlankState extends State<Blank> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: const Color(0xff123EB9),
          title: MyText.baseText(text: 'Thời Tiết Địa Phương'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => searchView()),
                ).then((value) {
                  setState(() {

                  });
                });
              },
              icon: MyIcon(icon: Icons.add_circle_outline),
            ),
          ],
        ),
        body: Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
          // color: Colors.blue.shade200,
          decoration: const BoxDecoration(color: Color(0xff123EB9)
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              //   image: AssetImage("assets/img/imgThienNhien1.jpg")
              // )
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 180,
                height: 180,
                child: Icon(
                  FontAwesomeIcons.locationDot,
                  color: Colors.white,
                  size: 70,
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: MyText.baseText(text: "")),
              TextButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => searchView()),
                  );
                },
                child: Container(
                  // margin: EdgeInsets.only(top: 30),
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  child: MyText.baseText(text: "Thêm"),
                ),
              )
            ],
          ),
        ));
    throw UnimplementedError();
  }
}
