import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practical_harsh/screen/getdata/user_profile.dart';
import '../../extra/getdataa/Product_Data.dart';
import '../../main/strings.dart';





class UserString extends StatefulWidget {
  const UserString({Key? key}) : super(key: key);

  @override
  State<UserString> createState() => _UserStringState();
}

class _UserStringState extends State<UserString> {
  late Future<ProductData> futureAlbum;
  //
  get mapjson => null;

  String stringjson = "";

  get decodejson => null;
  //

  Future<ProductData> getAlbum() async {
    var response = await http.get(Uri.parse('https://reqres.in/api/unknown'));

    if (response.statusCode == 200) {

      final mapjson = jsonDecode(response.body);
      print('${mapjson.runtimeType}');
      print('${decodejson}');
      final stringjson = jsonEncode(response.body);
      print('================${stringjson}');

     print('${stringjson.runtimeType}');
      return ProductData.fromJson(stringjson);
      // ProductData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(Strings.failed_to_load);
    }
  }
  @override
  void initState() {
    super.initState();
    futureAlbum = getAlbum();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<ProductData>
        (

        future: futureAlbum,

        builder: (
            context, snapshot) {
          if (snapshot.hasData) {

            return Container(
              child:
                Text('${stringjson}')
              // ListView.builder(
              //   primary: true,
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: snapshot.data == null
              //       ? 0
              //       : snapshot.data?.data?.length,
              //   itemBuilder: (context, index) {
              //     var color = Strings.OxFF +
              //         snapshot.data!.data![index]!.color!
              //             .substring(1, 7);
              //     var value = Color(int.parse(color));
              //     return Padding(
              //       padding: const EdgeInsets.all(2.0),
              //       child: GestureDetector(
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) =>
              //                   UserProfile(
              //                     // id: snapshot.data!.data![index]?.id,
              //                     color: snapshot.data!.data![index]
              //                         ?.color
              //                         .toString(),
              //                     name: snapshot.data!.data![index]
              //                         ?.name!
              //                         .toString(),
              //                   ),
              //             ),
              //           );
              //         },
              //         child:
              //         Card(
              //             child: ListTile(
              //               leading: Text(
              //                   snapshot.data!.data![index]!.id
              //                       .toString()),
              //               title: Text(
              //                   snapshot.data!.data![index]!.name!
              //                       .toString()),
              //               subtitle: Text(
              //                 snapshot.data!.data![index]!.year!
              //                     .toString(),
              //               ),
              //               trailing: Padding(
              //                 padding: const EdgeInsets.all(15.0),
              //                 child: Container(
              //                   height: 60,
              //                   width: 75,
              //                   color: value,
              //                   child: Center(
              //                     child: Text(
              //                       '${snapshot.data!.data![index]
              //                           ?.color?.substring(1, 7)}',
              //                       style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                           fontSize: 13),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               isThreeLine: true,
              //               dense: false,
              //             )),
              //       ),
              //     );
              //   },
              // ),
            );
          } else if (snapshot.hasError) {
            return Text('110--${snapshot.error}');
          }

          return const CircularProgressIndicator();
        },
      ),
    );

  }
}
