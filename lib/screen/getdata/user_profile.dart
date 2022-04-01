import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../extra/getdataa/Product_Data.dart';
import '../../main/strings.dart';
import '../../Model/user_data.dart';

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
    futureAlbum = usersAlbum() ;
  }

  @override
  Widget build(BuildContext context) {
    // final String? todo = id.toString();
    // final String? todoo = name.toString();
    // final String? todooo = color.toString();

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
                  itemCount:1,
                  // snapshot.data == null ? 0 : snapshot.data?.data?.length,
                  itemBuilder: (context, index) {
                    // var color = "0xFF" +
                    //     snapshot.data!.data![index].color!.substring(1, 7);
                    // var value = Color(int.parse(color));
                    

                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(
                            height: 15,
                          ),
                          Text("id: ${snapshot.data!.data!.id.toString()}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),),
                          SizedBox(
                            height: 15,
                          ),
                          Text(snapshot.data!.data!.name.toString()),
                          SizedBox(
                            height: 15,
                          ),
                          Text("color:${snapshot.data!.data!.color}"),
                          SizedBox(
                            height: 35,
                          ),
                        ],
                      ),

                      // ListTile(
                      //   leading: Text(snapshot.data!.data![index].id.toString()),
                      //   title: Text(snapshot.data!.data![index].name!.toString()),
                      //   subtitle: Text(
                      //     snapshot.data!.data![index].year!.toString(),
                      //   ),
                      //   trailing: Padding(
                      //     padding: const EdgeInsets.all(15.0),
                      //     child: Container(
                      //       height: 60,
                      //       width: 75,
                      //       color: value,
                      //       child: Center(
                      //         child: Text(
                      //           '${snapshot.data!.data![index].color?.substring(1, 7)}',
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.bold,
                      //               fontSize: 13),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      //   isThreeLine: true,
                      //   dense: false,
                      // ),
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
    //   Scaffold(
    //   body:
    //   Center(
    //     child: Column(
    //       // crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           "id: $todo",
    //           style: TextStyle(color: Colors.red),
    //         ),
    //         SizedBox(
    //           height: 7,
    //         ),
    //
    //         // Text("Name: $todoo"),
    //         // SizedBox(
    //         //   height: 7,
    //         // ),
    //         // Text("color: $todooo"),
    //       ],
    //     ),
    //   ),
    // );
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
