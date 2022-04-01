import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Model/Product_Data.dart';
import '../../main/strings.dart';

class UserProfile extends StatefulWidget {
  final int? id;

  // final String? name;
  // final String? color;
  Future<ProductData> fetchAlbum() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/unknown ${id}'));
    if (response.statusCode == 200) {
      return ProductData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(Strings.failed_to_load);
    }
  }

  const UserProfile({
    Key? key,
    this.id,
    // this.name, this.color
  }) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState(id
      // name, color
      );
}

class _UserProfileState extends State<UserProfile> {
  final int? id;

  // final String? color;
  // final String? name;

  _UserProfileState(
    this.id,
    // this.name, this.color
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String? todo = id.toString();
    // final String? todoo = name.toString();
    // final String? todooo = color.toString();

    return Scaffold(
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "id: $todo",
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(
              height: 7,
            ),

            // Text("Name: $todoo"),
            // SizedBox(
            //   height: 7,
            // ),
            // Text("color: $todooo"),
          ],
        ),
      ),
    );
  }
}
// Widget Text(){
//   return Style
// }
