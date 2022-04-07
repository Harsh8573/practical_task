import 'package:flutter/material.dart';
import 'package:practical_harsh/screen/practice/practice.dart';

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
    // List<int> lst=[2,3,4,5];
    // print(lst);
    //
    Set set =Set();
    print(set);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          primaryColor: Colors.orangeAccent[400],
          appBarTheme: AppBarTheme(elevation: 0.0)),
      home: practice(),
    );
  }
}
