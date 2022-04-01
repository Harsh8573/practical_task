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
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: theme.copyWith(
      //   colorScheme: theme.colorScheme
      //       .copyWith(primary: Colors.orangeAccent, secondary: Colors.green),
      //   textTheme:TextTheme(
      //      headline1:const TextStyle(
      //          fontWeight:FontWeight.bold,
      //          fontSize: 24,
      //          color: Colors.green)
      //   )
      // ),
      // ignore: prefer_const_constructors
      home: practice(),
    );
  }
}
