import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_weather/core/_config.dart' as cnf;
import 'package:my_weather/core/tocolor.dart';

class MyText {
  /**
   * Dành cho các text cơ bản thường dùng trong app
   */
  static Widget baseText(
      {String text = 'base',
      dynamic size = 18,
      FontWeight fontWeight = FontWeight.w500,
      String color = cnf.colorWhite,
      TextDecoration? decoration}) {
    return Text(
      text,
      style: TextStyle(
          decoration: decoration,
          fontSize: size.toDouble(),
          fontWeight: fontWeight,
          color: color.toColor()),
    );
  }

  static Widget hourText(
      {int text = 0,
      dynamic size = 18,
      FontWeight fontWeight = FontWeight.w500,
      String color = cnf.colorWhite,
      TextDecoration? decoration}) {
    return Text(
      DateFormat.Hm()
          .format(DateTime.fromMillisecondsSinceEpoch(text * 1000))
          .toString(),
      style: TextStyle(
          decoration: decoration,
          fontSize: size.toDouble(),
          fontWeight: fontWeight,
          color: color.toColor()),
    );
  }

   static Widget dayText(
      {int text = 0,
      dynamic size = 18,
      FontWeight fontWeight = FontWeight.w500,
      String color = cnf.colorWhite,
      TextDecoration? decoration}) {
    return Text(
      DateFormat.Md('vi')
          .format(DateTime.fromMillisecondsSinceEpoch(text * 1000))
          .toString(),
      style: TextStyle(
          decoration: decoration,
          fontSize: size.toDouble(),
          fontWeight: fontWeight,
          color: color.toColor()),
    );
  }

  static Widget date(
      {int text = 0,
      dynamic size = 18,
      FontWeight fontWeight = FontWeight.w500,
      String color = cnf.colorWhite,
      TextDecoration? decoration}) {
    return Text(
      DateFormat('dd/MM/yyyy')
          .format(DateTime.fromMillisecondsSinceEpoch(text * 1000))
          .toString(),
      style: TextStyle(
          decoration: decoration,
          fontSize: size.toDouble(),
          fontWeight: fontWeight,
          color: color.toColor()),
    );
  }

  static Widget temp(
      {
      
      String text = '',
      dynamic temp = 0,
      dynamic size = 18,
      FontWeight fontWeight = FontWeight.w500,
      String color = cnf.colorWhite}) {
    return Text(
      text + temp.toStringAsFixed(0) + '\u00B0',
      style: TextStyle(
          fontSize: size.toDouble(),
          fontWeight: fontWeight,
          color: color.toColor()),
    );
  }
}
