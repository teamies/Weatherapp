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

Widget getIconPlatForm(bool checkDay, String condition) {
  Image img;
  switch (condition) {
    //Thunderstorm
    case "Dông":
      img =  Image.asset('assets/img/imgweather/Thunderstorm.png');
      break;
      //light rain
    case "mưa nhẹ":
      img = (checkDay)
          ? Image.asset('assets/img/imgweather/lightRain_d.png')
          : Image.asset('assets/img/imgweather/lightRain_n.png');
      break;
    //moderate rain
    case "mưa vừa":
      img =  Image.asset('assets/img/imgweather/moderateRain.png');
      break;
    //Snow
    case "tuyết":
      img = Image.asset('assets/img/imgweather/snow.png');
      break;
    //few clouds
    case "mây thưa":
      img = (checkDay)
          ? Image.asset('assets/img/imgweather/fewclouds_d.png')
          : Image.asset('assets/img/imgweather/fewclouds_n.png');
      break;
    //scattered clouds
    case "mây rải rác":
      img = (checkDay)
          ? Image.asset('assets/img/imgweather/scatteredclouds_d.png')
          : Image.asset('assets/img/imgweather/fewclouds_n.png');
      break;
    //broken clouds
    case "mây cụm":
      img = Image.asset('assets/img/imgweather/brokenclouds.png');
      break;
    //overcast clouds
    case "mây đen u ám":
      img = Image.asset('assets/img/imgweather/overcastclouds.png');
      break;
    //clear sky
    case "bầu trời quang đãng":
      img = (checkDay)
          ? Image.asset('assets/img/imgweather/clearSky_d.png')
          : Image.asset('assets/img/imgweather/clearSky_n.png');
      break;

    default:
      img = Image.asset('assets/img/imgweather/brokenclouds.png');
  }

  return Padding(padding: const EdgeInsets.only(top: 5), child: img);
}
