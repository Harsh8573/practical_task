import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practical_harsh/main/strings.dart';

import '../Model/UserData.dart';
import '../Model/product_detail.dart';

Future<UserData> profileAlbum() async {
  final response = await http.get(Uri.parse('https://reqres.in/api/unknown'));

  if (response.statusCode == 200) {
    return UserData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(Strings.failed_to_load);
  }
}
class UserProfile extends StatefulWidget {
  const UserProfile(UserData? data, {Key? key, UserData? name}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Center(
        child: FutureBuilder<UserData>(
          future: profileAlbum(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: ListView.builder(
                  itemCount: 1,
                  // itemCount:
                  //     snapshot.data == null ? 0 : snapshot.data?.data?.length,
                  itemBuilder: (context, index) {
                    var color = "0xFF" +
                        snapshot.data!.data![index].color!.substring(1, 7);
                    var value = Color(int.parse(color));
                    var user_id = Text(
                      snapshot.data!.data![index].id.toString(),
                      style: TextStyle(color: Colors.white),
                    );
                    var name = Text(
                      snapshot.data!.data![index].name!.toString(),
                      style: TextStyle(color: Colors.white),
                    );
                    var year = Text(
                      snapshot.data!.data![index].year.toString(),
                      style: TextStyle(color: Colors.white),
                    );

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductDetail(),
                          settings : RouteSettings(
                            arguments:snapshot.data!.data![index],
                        ),
                        ),
                        );
                      },
                    );
                  },
                ),
              );
            }
            else
            if (snapshot.hasError) {
              return Text('110--${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
