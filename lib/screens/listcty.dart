import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:my_weather/core/_config.dart';

class ListCity extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('vi');
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img/imgThienNhien1.jpg"))),
          child: SafeArea(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.white,
                        icon: Icon(Icons.arrow_back_rounded)),
                    Expanded(
                        child: Container(
                      height: 40,
                      padding: EdgeInsets.only(top: 0, left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            hintText: 'Vị trí',
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 10, left: 15),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: .3, color: Colors.white70))),
                  child: MyText.baseText(text: 'Danh Sách Thành Phố', size: 16),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.baseText(text: 'Thái Nguyên'),
                                MyText.baseText(
                                    text: 'Thái Nguyên, Việt nam',
                                    color: colorWhiteOpacity,
                                    size: 16),
                                MyText.baseText(
                                    text: DateFormat.MMMEd('vi')
                                        .add_jm()
                                        .format(DateTime.now()),
                                    color: colorWhiteOpacity,
                                    size: 16),
                                // Text('Thái Nguyên, Việt Nammmmm', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color:  Color(0xB8FCFBFB)),),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Icon(Icons.cloud),
                                    ),
                                    MyText.temp(temp: 22, size: 24),
                                  ],
                                ),
                                Row(
                                  children: [
                                    MyText.temp(
                                      temp: 22,
                                      size: 16,
                                      color: colorWhiteOpacity,
                                    ),
                                    MyText.baseText(
                                        text: '/ ',
                                        color: colorWhiteOpacity,
                                        size: 16),
                                    MyText.temp(
                                      temp: 25,
                                      size: 16,
                                      color: colorWhiteOpacity,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )),
              ],
            ),
          ))),
    );
  }
}