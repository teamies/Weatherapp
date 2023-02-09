import 'package:flutter/material.dart';
import 'package:my_weather/components/myicon.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:my_weather/screens/listcty.dart';
import 'package:my_weather/screens/test.dart';

class MyDrawer extends StatelessWidget {
  final List<dynamic> _menu = [
    {'title': 'Trang chủ', 'icon': Icons.home, 'view': Test()},
    {'title': 'Chỉnh sửa vị trí', 'icon': Icons.map, 'view': ListCity()},
    {'title': 'ABC', 'icon': Icons.map, 'view': null},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img/troi-xanh.jpg"))),
          // color: Color.fromARGB(255, 22, 85, 136),
          child: ListView.builder(
            padding: EdgeInsets.only(top: 25, bottom: 25),
            itemCount: _menu.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (this._menu[index]['view'] != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => this._menu[index]['view']),
                    );
                  }
                  print('Không co view');
                },
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: MyIcon(
                            icon: this._menu[index]['icon'],
                          )),
                      Expanded(
                          flex: 4,
                          child: MyText.baseText(text: _menu[index]['title']))
                    ],
                  ),
                ),
              );
            },
          )),
    );
    throw UnimplementedError();
  }
}
