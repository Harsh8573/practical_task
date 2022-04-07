import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practical_harsh/main/strings.dart';
import 'package:practical_harsh/screen/getdata/user_details.dart';
import 'package:practical_harsh/screen/getdata/user_preference.dart';
import 'package:practical_harsh/screen/getdata/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/user_data.dart';
import '../../extra/getdataa/Product_Data.dart';

Future<ProductData> getAlbum() async {
  final response = await http.get(Uri.parse('https://reqres.in/api/unknown'));
  if (response.statusCode == 200) {
    return ProductData.fromJson(jsonDecode(response.body));

  } else {
    throw Exception(Strings.failed_to_load);
  }
}

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late SharedPreferences prefs;

  String name = " ";


  late Future<ProductData> futureAlbum;

  String? get jsonString => null;



  @override
  void initState() {
    super.initState();
    futureAlbum = getAlbum();
    initalize();
  }

  void initalize() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Strings.fetch_data),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<ProductData>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    child: ListView.builder(
                      primary: true,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data == null
                          ? 0
                          : snapshot.data?.data?.length,
                      itemBuilder: (context, index) {
                        var color = Strings.OxFF +
                            snapshot.data!.data![index]!.color!
                                .substring(1, 7);
                        var value = Color(int.parse(color));
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      UserProfile(
                                        id: snapshot.data!.data![index]?.id,
                                        color: snapshot.data!.data![index]
                                            ?.color
                                            .toString(),
                                        name: snapshot.data!.data![index]
                                            ?.name!
                                            .toString(),
                                      ),
                                ),
                              );
                            },
                            child: Card(
                                child: ListTile(
                                  leading: Text(
                                      snapshot.data!.data![index]!.id
                                          .toString()),
                                  title: Text(
                                      snapshot.data!.data![index]!.name!
                                          .toString()),
                                  subtitle: Text(
                                    snapshot.data!.data![index]!.year!
                                        .toString(),
                                  ),
                                  trailing: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      height: 60,
                                      width: 75,
                                      color: value,
                                      child: Center(
                                        child: Text(
                                          '${snapshot.data!.data![index]
                                              ?.color?.substring(1, 7)}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                      ),
                                    ),
                                  ),
                                  isThreeLine: true,
                                  dense: false,
                                )),
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('110--${snapshot.error}');
                }

                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

// objectsave() async {
//   Map response = jsonDecode(jsonString!);
//   String res = jsonEncode(UserData.fromJson(json));
//   prefs.setString('userData', user);
// }
}
// import 'dart:async';
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:practical_harsh/main/strings.dart';
// import 'package:practical_harsh/screen/getdata/user_details.dart';
// import 'package:practical_harsh/screen/getdata/user_profile.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../extra/getdataa/Product_Data.dart';
//
// Future<ProductData> getAlbum() async {
//   final response = await http.get(Uri.parse('https://reqres.in/api/unknown'));
//   if (response.statusCode == 200) {
//     return ProductData.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception(Strings.failed_to_load);
//   }
// }
//
// class UserList extends StatefulWidget {
//   const UserList({Key? key}) : super(key: key);
//
//   @override
//   _UserListState createState() => _UserListState();
// }
//
// class _UserListState extends State<UserList> {
//   late SharedPreferences prefs;
//   late Future<ProductData> futureAlbum;
//   String name = " ";
//
//   @override
//   void initState() {
//     super.initState();
//     futureAlbum = getAlbum();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(Strings.fetch_data),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: FutureBuilder<ProductData>(
//             future: futureAlbum,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Container(
//                   child: ListView.builder(
//                     primary: true,
//                     shrinkWrap: true,
//                     // physics: NeverScrollableScrollPhysics(),
//                     itemCount:
//                         snapshot.data == null ? 0 : snapshot.data?.data?.length,
//                     itemBuilder: (context, index) {
//                       var color = Strings.OxFF +
//                           snapshot.data!.data![index]!.color!.substring(1, 7);
//                       var value = Color(int.parse(color));
//                       return Padding(
//                         padding: const EdgeInsets.all(2.0),
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => UserDetail(
//                                   // data: snapshot.data?.data![index],
//                                   id: snapshot.data!.data![index]?.id,
//                                   color: snapshot.data!.data![index]?.color
//                                       .toString(),
//                                   name: snapshot.data!.data![index]?.name!
//                                       .toString(),
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Card(
//                             child: ListTile(
//                               leading: Text(
//                                   snapshot.data!.data![index]!.id.toString()),
//                               title: Text(snapshot.data!.data![index]!.name!
//                                   .toString()),
//                               subtitle: Text(
//                                 snapshot.data!.data![index]!.year.toString(),
//                               ),
//                               trailing: Padding(
//                                 padding: const EdgeInsets.all(15.0),
//                                 child: Container(
//                                   height: 60,
//                                   width: 75,
//                                   color: value,
//                                   child: Center(
//                                     child: Text(
//                                       '${snapshot.data!.data![index]?.color?.substring(1, 7)}',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 13),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               isThreeLine: true,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               } else if (snapshot.hasError) {
//                 return Text('110--${snapshot.error}');
//               }
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
