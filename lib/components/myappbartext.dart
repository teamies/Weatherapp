import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:my_weather/components/mytext.dart';

class MyAppBarText extends StatelessWidget {
  late String cityName;
  MyAppBarText({this.cityName = 'Thái Nguyên'});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('vi');
    return Center(
      child: Column(
        children: [
          MyText.baseText(text: this.cityName, fontWeight: FontWeight.bold),
          MyText.baseText(
              text: DateFormat.MMMEd('vi').add_jm().format(DateTime.now()),
              size: 16)
        ],
      ),
    );
    throw UnimplementedError();
  }
}
