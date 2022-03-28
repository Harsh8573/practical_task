import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practical_harsh/Model/user_profile.dart';
import 'package:practical_harsh/strings.dart';

import 'UserData.dart';

Future<UserData> fetchAlbum() async {
  final response = await http.get(Uri.parse('https://reqres.in/api/unknown'));

  if (response.statusCode == 200) {
    return UserData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(Strings.failed_to_load);
  }
}

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  late Future<UserData> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Strings.fetch_data),
      ),
      body: Center(
        child: FutureBuilder<UserData>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: ListView.builder(
                  itemCount:
                      snapshot.data == null ? 0 : snapshot.data?.data?.length,
                  itemBuilder: (context, index) {
                    var color = "0xFF" +
                        snapshot.data!.data![index].color!.substring(1, 7);
                    var value = Color(int.parse(color));
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UserProfile()));
                          },
                          leading: (Icon(Icons.eleven_mp)),
                          title: Text(snapshot.data!.data![index].name!),
                          subtitle: Text(
                            snapshot.data!.data![index].year!.toString(),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              height: 60,
                              width: 75,
                              color: value,
                              child: Center(
                                child: Text(
                                  '${snapshot.data!.data![index].color?.substring(1, 7)}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ),
                          isThreeLine: true,
                          dense: false,
                        ),
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
      ),
    );
  }
}


// Future<UserData> profileAlbum() async {
//   final response = await http.get(Uri.parse('https://reqres.in/api/unknown/id'));
//
//   if (response.statusCode == 200) {
//     return UserData.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception(Strings.failed_to_load);
//   }
// }
// class UserProfile extends StatefulWidget {
//   const UserProfile({Key? key}) : super(key: key);
//
//   @override
//   State<UserProfile> createState() => _UserProfileState();
// }
//
// class _UserProfileState extends State<UserProfile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Profile"),
//       ),
//       body: Center(
//         child: FutureBuilder<UserData>(
//           future: profileAlbum(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Container(
//                 child: ListView.builder(
//                   // itemCount: 6,
//                   // itemCount:
//                   //     snapshot.data == null ? 0 : snapshot.data?.data?.length,
//                   itemBuilder: (context, index) {
//                     var color = "0xFF" +
//                         snapshot.data!.data![index].color!.substring(1, 7);
//                     var value = Color(int.parse(color));
//                     var user_id = Text(
//                       snapshot.data!.data![index].id.toString(),
//                       style: TextStyle(color: Colors.white),
//                     );
//                     var name = Text(
//                       snapshot.data!.data![index].name!.toString(),
//                       style: TextStyle(color: Colors.white),
//                     );
//                     var year = Text(
//                       snapshot.data!.data![index].year.toString(),
//                       style: TextStyle(color: Colors.white),
//                     );
//
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Card(
//                         child: Container(
//                           color: value,
//                           child: Padding(
//                             padding: const EdgeInsets.all(30.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[user_id, name, year],
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             }
//     else
//     if (snapshot.hasError) {
//               return Text('110--${snapshot.error}');
//             }
//
//             return const CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }
// }
