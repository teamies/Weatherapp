import 'package:flutter/material.dart';
import 'package:my_weather/Models/seach.dart';
import 'package:my_weather/core/local.dart';
import 'package:my_weather/home.dart';
import 'package:my_weather/screens/blank.dart';


void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp>
{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => initScreen(),
      }
    );
  }

  Widget initScreen()
  {
    return FutureBuilder(
        future: Local().getList(value: false),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.length > 0) {
              Town _town = Town.fromJson(snapshot.data![0]);
              return Home(
                town: _town,
              );
            } else {
              return Blank();
            }
          } else {
            // Hiển thị màn hình chờ
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
