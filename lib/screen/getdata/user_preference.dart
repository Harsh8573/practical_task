import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/user_data.dart';
import '../../extra/getdataa/Product_Data.dart';
import '../../main/strings.dart';

class UserPreference extends StatefulWidget {
  UserDetail? data;

  UserPreference({Key? key, this.data, this.id, this.color, this.name})
      : super(key: key);

  final int? id;
  final String? color;
  late final String? name;

  @override
  State<UserPreference> createState() => _UserPreferenceState(id, name, color);
}

class _UserPreferenceState extends State<UserPreference> {
  final int? id;
  late final futureAlbum;
  final String? color;
  late final String? name;

  _UserPreferenceState(this.id, this.name, this.color);

  // TextEditingController _controller = TextEditingController();
  late SharedPreferences prefs;

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Container(
            child: Text('h'),

          ),
            TextField(

              decoration: InputDecoration(
                hintText: save(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                save();
              },
              child: Text("Save"),
            ),
            ElevatedButton(
              onPressed: () {
                retrive();
              },
              child: Text("Retrive"),
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

  save() {
    prefs.setString('text', 'haeesh');
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
Widget applyMarginTop({double height = 20.0}) {
  return SizedBox(
    height: height,
  );
}
