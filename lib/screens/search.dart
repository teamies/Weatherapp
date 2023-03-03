import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:my_weather/Models/seach.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:my_weather/controller/search.dart';
import 'package:my_weather/core/_config.dart';
import 'package:my_weather/core/local.dart';

class searchView extends StatefulWidget {
  @override
  State<searchView> createState() => _searchViewState();
}

class _searchViewState extends State<searchView> {
  late String _query;
  late Search _search;
  late String _results = '';

  Local _localStorage = Local();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _search = new Search();
    print('load search');
  }

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
                        onChanged: (value) {
                          if (value.length > 3) {
                            setState(() {
                              _results = value;
                            });
                          }
                        },
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
                        child: FutureBuilder<List<Town>>(
                          future: this._search.getName(this._results),
                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data!.length > 0) {
                              return ListView.builder(
                                itemCount: snapshot.data?.length,
                                itemBuilder: (context, index) {
                                  return TextButton(
                                    child: MyText.baseText(text: snapshot.data![index].name),
                                    onPressed: () async {
                                      await _localStorage
                                          .addToList(snapshot.data![index]);
                                      // Navigator.of(context, rootNavigator: true)
                                      //     .pop();
                                      Navigator.pushNamed(context, '/');
                                    },
                                  );
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
