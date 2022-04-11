import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practical_harsh/screen/getdata/user_list.dart';
import 'package:practical_harsh/screen/getdata/user_profile.dart';
import 'package:practical_harsh/screen/practice/practice.dart';
import 'package:http/http.dart' as http;
import 'extra/getdataa/Product_Data.dart';
import 'main/const.dart';
import 'main/strings.dart';

void main() {
  for (display x in display.values) {
    print(x);
  }
  runApp(MyApp());
}
enum display{
  my,
  name,
  harsh
}
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //---------------------------------------------------
    // print('#Simple!!');
    // var a= 'Hey Harsh';
    // print(a);
    //---------------------------------------------------
    // print('#Expression check null!!');
    // var b;
    // var c='Jigs';
    // var d= b??c;
    // print(d);
    //---------------------------------------------------
    // print('#Outer!!');
    // var e = 6;
    // void outer() {
    //   e = 4;
    // }
    // outer();
    // print(e);
    //---------------------------------------------------
    // print('#List!!');
    // List l=[2,3,4,5];
    // print(l.runtimeType);
    // l.clear();
    // print(l);
    //---------------------------------------------------
    // print('#Set!!');
    // Set s =Set();
    // s.add([10,20]);
    // print(s);
    //---------------------------------------------------
    // print('#Decode to String!!');
    //     const JsonDecoder decoder = JsonDecoder();
    //     const String jsonString = '''
    //   {
    //     "data": [{"text": "foo", "value": 1 },
    //              {"text": "bar", "value": 2 }],
    //     "text": "Dart"
    //   }
    // ''';
    //     final Map<String, dynamic> obj = decoder.convert(jsonString);
    //     final item = obj['data'][0];
    //     print(item['text']); // foo
    //     print(item['value']); // 1
    //     print(obj['text']); // Dart
    //     print(obj['data']); // Dart
    //---------------------------------------------------
    // print('#future data!!');
    // Future<ProductData> getAlbum() async {
    //
    //   var response = await http.get(Uri.parse('https://reqres.in/api/unknown'));
    //
    //   if (response.statusCode == 200) {
    //     final mapjson = jsonDecode(response.body);
    //     print('${mapjson.runtimeType}');
    //     // print('${decodejson}');
    //     var stringjson = jsonEncode(response.body);
    //     print('${stringjson}');
    //
    //     print('${stringjson.runtimeType}');
    //     return ProductData.fromJson(stringjson);
    //   // ProductData.fromJson(jsonDecode(response.body));
    //   } else {
    //     throw Exception(Strings.failed_to_load);
    //   }
    // }
    // var futureAlbum = getAlbum();
    // FutureBuilder<ProductData>(
    //
    //   future: futureAlbum,
    //
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //
    //       return Container(
    //         child: ListView.builder(
    //           primary: true,
    //           shrinkWrap: true,
    //           physics: NeverScrollableScrollPhysics(),
    //           itemCount: snapshot.data == null
    //               ? 0
    //               : snapshot.data?.data?.length,
    //           itemBuilder: (context, index) {
    //             var color = Strings.OxFF +
    //                 snapshot.data!.data![index]!.color!
    //                     .substring(1, 7);
    //             var value = Color(int.parse(color));
    //             return Padding(
    //               padding: const EdgeInsets.all(2.0),
    //               child: GestureDetector(
    //                 onTap: () {
    //                   Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                       builder: (context) =>
    //                           UserProfile(
    //                             id: snapshot.data!.data![index]?.id,
    //                             color: snapshot.data!.data![index]
    //                                 ?.color
    //                                 .toString(),
    //                             name: snapshot.data!.data![index]
    //                                 ?.name!
    //                                 .toString(),
    //                           ),
    //                     ),
    //                   );
    //                 },
    //                 child: Card(
    //                     child: ListTile(
    //                       leading: Text(
    //                           snapshot.data!.data![index]!.id
    //                               .toString()),
    //                       title: Text(
    //                           snapshot.data!.data![index]!.name!
    //                               .toString()),
    //                       subtitle: Text(
    //                         snapshot.data!.data![index]!.year!
    //                             .toString(),
    //                       ),
    //                       trailing: Padding(
    //                         padding: const EdgeInsets.all(15.0),
    //                         child: Container(
    //                           height: 60,
    //                           width: 75,
    //                           color: value,
    //                           child: Center(
    //                             child: Text(
    //                               '${snapshot.data!.data![index]
    //                                   ?.color?.substring(1, 7)}',
    //                               style: TextStyle(
    //                                   fontWeight: FontWeight.bold,
    //                                   fontSize: 13),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       isThreeLine: true,
    //                       dense: false,
    //                     )),
    //               ),
    //             );
    //           },
    //         ),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Text('110--${snapshot.error}');
    //     }
    //
    //     return const CircularProgressIndicator();
    //   },
    // );
    //---------------------------------------------------
    // print('#Foreach');
    // var f=[100,200,300,400];
    // f.forEach(
    //     (x)=> print(x)
    // //(element) {print(element);}
    // );
    //---------------------------------------------------
    // print('#Foreach');
    // Map map={'1':100,'2':'200','3':300,'4':400};
    // map.forEach((key,value) =>  print('$key : $value'));
    // print('-----');
    // map.forEach((b,c) =>  print('$b : $c'));
    //---------------------------------------------------
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
