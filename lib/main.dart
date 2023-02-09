import 'package:flutter/material.dart';
import 'package:my_weather/Models/seach.dart';
import 'package:my_weather/core/local.dart';
import 'package:my_weather/home.dart';
import 'package:my_weather/screens/blank.dart';

void main() {
  Local local = Local();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool check = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Local().getList(value: false),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length > 0) {
              Town _town = Town.fromJson(snapshot.data);
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
