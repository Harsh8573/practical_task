import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'UserData.dart';

Future<UserData> fetchAlbum() async {
  final response = await http.get(Uri.parse('https://reqres.in/api/unknown'));

  if (response.statusCode == 200) {
    return UserData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
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
        title: const Text('Fetch Data'),
      ),
      body: Center(
        child: FutureBuilder<UserData>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  // color: Colors.[100],
                  child: ListView.builder(
                itemCount:  snapshot
                    .data ==null?0: snapshot
                    .data?.data?.length,
                itemBuilder: (context, index) => ListTile(
                  leading: (Icon(Icons.eleven_mp)),
                  title: Text(snapshot.data!.data![index].name!),
                  subtitle: Text(
                    snapshot.data!.data![index].year!.toString(),
                  ),
                  isThreeLine: true,
                  dense: false,

                  // trailing: Container(
                  //
                  //   padding: EdgeInsets.only(left: 100),
                  //
                  //     color: Colors.blueAccent[200]
                  //
                  // ),
                ),
              ));
              // Text(snapshot.data!.data![0].id.toString());
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
