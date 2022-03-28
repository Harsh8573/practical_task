import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
                // color: Colors.[100],
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
