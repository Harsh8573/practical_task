import 'package:flutter/material.dart';
import 'package:practical_harsh/screen/practice/practice.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        primaryColor: Colors.orangeAccent[400],
        appBarTheme: AppBarTheme(
          elevation: 0.0
        )
      ),
      home: practice(),
    );
  }
}
