import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Model/user_data.dart';
import '../../main/strings.dart';

class UserProfile extends StatefulWidget {
  final int? id;

  final String? name;
  final String? color;

  const UserProfile({Key? key, this.id, this.name, this.color})
      : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState(id, name, color);
}

class _UserProfileState extends State<UserProfile> {
  final int? id;
  late final futureAlbum;
  final String? color;
  final String? name;

  _UserProfileState(this.id, this.name, this.color);

  @override
  void initState() {
    super.initState();
    futureAlbum = usersAlbum();
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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  applyMarginTop(),
                  Text(
                    "id: ${id}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  applyMarginTop(),
                  Text('Name :  ${name!}'),
                  applyMarginTop(),
                  Text("Color:  ${color!.substring(1,7)}"),
                  SizedBox(
                    height: 35,
                  ),
                ],
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

  Future<UserData> usersAlbum() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/unknown/${id}'));
    if (response.statusCode == 200) {
      return UserData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(Strings.failed_to_load);
    }
  }
}

Widget applyMarginTop({double height = 20.0}) {
  return SizedBox(
    height: height,
  );
}
