import 'package:flutter/material.dart';

/**
 * Lấy ra ảnh hiển thị
 * 
 * @parame
 * 
 * check Nếu bằng true thì là ban đêm
 * String
 * 
 * @return Image 
 */
Widget getIconPlatForm(bool check, String condition) {
  Image img;
  switch (condition) {
    case "Thunderstorm":
      img = (check)
          ? Image.asset('assets/img/imgweather/Thunderstorm.png')
          : Image.asset('assets/img/imgweather/Thunderstorm.png');
      break;
    case "light rain":
      img = (check)
          ? Image.asset('assets/img/imgweather/lightRain_n.png')
          : Image.asset('assets/img/imgweather/lightRain_d.png');
      break;
    case "moderate rain":
      img = (check)
          ? Image.asset('assets/img/imgweather/moderateRain.png')
          : Image.asset('assets/img/imgweather/moderateRain.png');
      break;
    case "Snow":
      img = (check)
          ? Image.asset('assets/img/imgweather/snow.png')
          : Image.asset('assets/img/imgweather/snow.png');
      break;
    case "few clouds":
      img = (check)
          ? Image.asset('assets/img/imgweather/fewclouds_n.png')
          : Image.asset('assets/img/imgweather/fewclouds_d.png');
      break;
    case "scattered clouds":
      img = (check)
          ? Image.asset('assets/img/imgweather/fewclouds_n.png')
          : Image.asset('assets/img/imgweather/scatteredclouds_d.png');
      break;
    case "broken clouds":
      img = (check)
          ? Image.asset('assets/img/imgweather/brokenclouds.png')
          : Image.asset('assets/img/imgweather/brokenclouds.png');
      break;
    case "overcast clouds":
      img = (check)
          ? Image.asset('assets/img/imgweather/overcastclouds.png')
          : Image.asset('assets/img/imgweather/overcastclouds.png');
      break;
    case "clear sky":
      img = (check)
          ? Image.asset('assets/img/imgweather/clearSky_n.png')
          : Image.asset('assets/img/imgweather/clearSky_d.png');
      break;

    default:
      img = (check)
          ? Image.asset('assets/img/imgweather/brokenclouds.png')
          : Image.asset('assets/img/imgweather/brokenclouds.png');
  }

  return Padding(padding: const EdgeInsets.only(top: 5), child: img);
}
