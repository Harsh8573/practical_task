
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import '../../../Model/user_data.dart';
import '../../../extra/getdataa/Product_Data.dart';
import '../../../main/strings.dart';
void main(){
  runApp(Shared_preference());
}
class Shared_preference extends StatefulWidget {
  const Shared_preference({Key? key}) : super(key: key);

  @override
  State<Shared_preference> createState() => _Shared_preferenceState();
}

class _Shared_preferenceState extends State<Shared_preference> {
  TextEditingController _controller = TextEditingController();
  late SharedPreferences prefs;

  String name = " ";

  @override
  void initState() {
    super.initState();
    initalize();
  }

  void initalize() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  fillColor: Colors.blue,
                  prefixIcon: Icon(Icons.archive_rounded),
                  hintText: 'Enter Data',
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                child: TextField(


                  readOnly: true,
                  decoration: InputDecoration(

                      prefixIcon: Icon(Icons.account_tree),
                      hintText: name,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  save();
                },
                child: Text("Save"),
              ),
              SizedBox(
                height: 10,
              ),

              ElevatedButton(
                onPressed: () {
                  retrive();
                },
                child: Text("Saved Data"),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  delete();
                },
                child: Text("Delete"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  save() async {
    prefs.setString('text', _controller.text.toString());
  }

  retrive() async {
    setState(() {
      name = prefs.getString('text')!;
    });
  }

  delete() async {
    prefs.remove('text');
    name = "";
    setState(() {});
  }
}


// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart'as http;
// import '../../../Model/user_data.dart';
// import '../../../extra/getdataa/Product_Data.dart';
// import '../../../main/strings.dart';
//
// class Shared_preference extends StatefulWidget {
//   const Shared_preference({Key? key}) : super(key: key);
//
//   @override
//   State<Shared_preference> createState() => _Shared_preferenceState();
// }
//
// class _Shared_preferenceState extends State<Shared_preference> {
//   TextEditingController _controller = TextEditingController();
//   late SharedPreferences prefs;
//
//   String name = " ";
//
//   @override
//   void initState() {
//     super.initState();
//     initalize();
//     initalGetSavedata();
//   }
//   void initalGetSavedata() async{
//     prefs = await SharedPreferences.getInstance();
//     Map<String , dynamic> jsondetails = jsonDecode(prefs.getString('res')!);
//     UserData data = UserData.fromJson(jsondetails);
//     if (jsondetails.isEmpty){
//       _controller.value = TextEditingValue(text: data.name);
//     }
//   }
//   void Storeddata(){
//     UserData data = UserData( );
//     String res = jsonEncode(data);
//     print(res);
//    prefs.setString('res', res);
//   }
//
//   void initalize() async {
//     prefs = await SharedPreferences.getInstance();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 fillColor: Colors.blue,
//                 prefixIcon: Icon(Icons.archive_rounded),
//                 hintText: 'Enter data',
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               width: 200,
//               child: TextField(
//                 readOnly: true,
//                 decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.account_tree),
//                     hintText: name,
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5))),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 save();
//                 Storeddata();
//               },
//               child: Text("Save"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 retrive();
//               },
//               child: Text("Retrive"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 delete();
//               },
//               child: Text("Delete"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   save() async {
//     prefs.setString('text', _controller.text.toString());
//   }
//
//   retrive() async {
//     setState(() {
//       name = prefs.getString('text')!;
//     });
//   }
//
//   delete() async {
//     prefs.remove('text');
//     name = "";
//     setState(() {});
//   }
// }
// objectsave()async{
//   Map json = jsonDecode(jsonString);
//   String user = jsonEncode(UserData.fromJson(json));
//   prefs.setString('userData', user);
// }
// objectfetch() async{
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   Map json = jsonDecode(pref.getString('userData'));
//   var user = UserModel.fromJson(json);
// }
