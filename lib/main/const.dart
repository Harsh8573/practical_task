import 'package:flutter/material.dart';
import 'package:practical_harsh/main.dart';

class Constant{
  static const String date_formate = 'yyyy-MM-dd';
}
void main(){
  runApp(Conts());
}
class Conts extends StatefulWidget {
  const Conts({Key? key}) : super(key: key);

  @override
  State<Conts> createState() => _ContsState();
}

class _ContsState extends State<Conts> {
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
    //
    //     final Map<String, dynamic> object = decoder.convert(jsonString);
    //
    //     final item = object['data'][0];
    //     print(item['text']); // foo
    //     print(item['value']); // 1
    //
    //     print(object['text']); // Dart
    //     print(object['data']); // Dart
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('harsh'),
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Column(
            children: [
              Container(
                color: Colors.blue[200],
              ),
              Container(
                color: Colors.orangeAccent[200],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
