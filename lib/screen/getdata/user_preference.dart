import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/user_data.dart';
import '../../main/strings.dart';

class UserPreference extends StatefulWidget {
  final int? id;

  final String? name;
  final String? color;

  const UserPreference({Key? key, this.id, this.name, this.color})
      : super(key: key);

  @override
  State<UserPreference> createState() => _UserPreferenceState(id, name, color);
}

class _UserPreferenceState extends State<UserPreference> {
  final int? id;
  late final futureAlbum;
  final String? color;
  final String? name;

  _UserPreferenceState(this.id, this.name, this.color);

  TextEditingController _controller = TextEditingController();
  late SharedPreferences prefs;
  String nameis = " ";

  @override
  void initState() {
    super.initState();
    futureAlbum = usersAlbum();
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
                  Text(name!),
                  applyMarginTop(),
                  Text(color!),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                        height: 50,
                        color: Colors.cyan,
                        child: Center(child: Text('${id}      ${name}      ${color}'))),
                  )
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
