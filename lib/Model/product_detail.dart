import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../strings.dart';
import 'UserData.dart';

class ProductDetail extends StatefulWidget {
  final int? id;
  final String? name;
  final String? color;
  Future<UserData> fetchAlbum() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/unknown/${id}'));
    if (response.statusCode == 200) {
      return UserData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(Strings.failed_to_load);
    }
  }
  const ProductDetail({Key? key, this.id, this.name, this.color}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState(id, name, color);
}

class _ProductDetailState extends State<ProductDetail> {
  final int? id;
  final String? color;
  final String? name;

  _ProductDetailState(this.id, this.name, this.color);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String? todo = id.toString();
    final String? todoo = name.toString();
    final String? todooo = color.toString();

    return Scaffold(
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("id: $todo"),
            SizedBox(
              height: 7,
            ),
            Text("Name: $todoo"),
            SizedBox(
              height: 7,
            ),
            Text("color: $todooo"),
          ],
        ),
      ),
    );
  }
}
// Widget Text(){
//   return Style
// }
