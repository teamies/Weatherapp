import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:my_weather/Models/seach.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:my_weather/core/_config.dart';
import 'package:my_weather/core/local.dart';

class ListCity extends StatefulWidget {
  @override
  State<ListCity> createState() => _ListCityState();
}

class _ListCityState extends State<ListCity> {
  Local _local = Local();

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
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 10,),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: .3, color: Colors.white70))),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        color: Colors.white,
                        icon: Icon(Icons.arrow_back_rounded)),
                      MyText.baseText(text: 'Danh Sách Thành Phố', size: 20),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(15),
                        child: FutureBuilder<List<dynamic>>(
                          future: this._local.getList(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  Town _town =
                                      Town.fromJson(snapshot.data![index]);
                                  return GestureDetector(
                                      onTap: () async {
                                        await this._local.addToList(_town);
                                        // Navigator.of(context, rootNavigator: true)
                                        //     .pop();
                                        Navigator.pushNamed(context, '/');
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MyText.baseText(
                                                    text: (_town.localNames[
                                                                'vi'] !=
                                                            null)
                                                        ? _town.localNames['vi']
                                                        : _town.name),
                                                MyText.baseText(
                                                    text: _town.name +
                                                        ', ' +
                                                        _town.country,
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
                                          ],
                                        ),
                                      ));
                                },
                              );
                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ))),
              ],
            ),
          ))),
    );
  }
}
