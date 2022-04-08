import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practical_harsh/screen/getdata/user_list.dart';
import 'package:practical_harsh/screen/practice/practice.dart';

import 'main/const.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var a= 'Hey Harsh';
    // print(a);
    //
    // var b;
    // var c='Jigs';
    // var d= b??c;
    // print(d);
    //
    // var e = 6;
    // void outer() {
    //   e = 4;
    // }
    // outer();
    // print(e);
    //
    // List l=[2,3,4,5];
    // print(l.runtimeType);
    // l.clear();
    // print(l);
    //
    // Set s =Set();
    // s.add([10,20]);
    // print(s);
    //
    //     const JsonDecoder decoder = JsonDecoder();
    //
    //     const String jsonString = '''
    //   {
    //     "data": [{"text": "foo", "value": 1 },
    //              {"text": "bar", "value": 2 }],
    //     "text": "Dart"
    //   }
    // ''';

        // final Map<String, dynamic> object = decoder.convert(jsonString);

        // final item = object['data'][0];
        // print(item['text']); // foo
        // print(item['value']); // 1
        //
        // print(object['text']); // Dart
        // print(object['data']); // Dart

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          primaryColor: Colors.orangeAccent[400],
          appBarTheme: AppBarTheme(elevation: 0.0)),
      home: UserList(),
    );
  }
}
