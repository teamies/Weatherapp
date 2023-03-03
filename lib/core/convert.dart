import 'package:flutter/material.dart';

import '../components/mytext.dart';

String UVCondition(num uvi) {
    if (uvi >= 0 && uvi <= 2) {
      return 'Thấp';
    } else if (2 < uvi && uvi <= 7) {
      return 'Cao';
    } else if (7 < uvi && uvi < 11) {
      return  'Rất cao';
    } else if (uvi >= 11) {
      return 'Cực kỳ cao';
    }
    return 'Không xác định';
  }

String windDegCondition(num windDeg) {
    if (windDeg == 0 && windDeg == 360) {
      return 'Bắc';
    } else if (0 < windDeg && windDeg <= 22.5) {
      return 'Bắc đông bắc';
    } else if (22.5 < windDeg && windDeg <= 67.5) {
      return 'Đông bắc';
    } else if (67.5 < windDeg && windDeg < 90) {
      return 'Đông đông bắc';
    } else if (90 == windDeg) {
      return 'Đông';
    } else if (90 < windDeg && windDeg <= 112.5) {
      return 'Đông đông nam';
    } else if (112.5 < windDeg && windDeg <= 157.5) {
      return 'Đông nam';
    } else if (157.5 < windDeg && windDeg < 180) {
      return 'Nam đông nam';
    } else if (180 == windDeg) {
      return 'Nam';
    } else if (180 < windDeg && windDeg <= 202.5) {
      return 'Nam tây nam';
    } else if (202.5 < windDeg && windDeg <= 247.5) {
      return 'Tây nam';
    } else if (247.5 < windDeg && windDeg < 270) {
      return 'Tây tây nam';
    } else if (270 == windDeg) {
      return 'Tây ';
    } else if (270 < windDeg && windDeg <= 292.5) {
      return 'Tây tây bắc';
    } else if (292.5 < windDeg && windDeg <= 337.5) {
      return 'Tây bắc';
    } else if (337.5 < windDeg && windDeg < 360) {
      return 'Bắc tây bắc';
    }
    return windDeg.toString();
  }