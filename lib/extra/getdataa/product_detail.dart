import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../main/strings.dart';
import 'Product_Data.dart';

class ProductDetail extends StatefulWidget {
  final int? id;
  final String? name;
  final String? color;
  Future<ProductData> fetchAlbum() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/unknown ${id}'));
    if (response.statusCode == 200) {
      return ProductData.fromJson(jsonDecode(response.body));
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

  TextEditingController _controller = TextEditingController();
  late SharedPreferences prefs;

  String nameis = " ";
  @override
  void initState() {
    super.initState();
    initalize();
  }
  void initalize() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final String? todo = id.toString();
    final String? todoo = name.toString();
    final String? todooo = color.toString();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            // TextField(
            //   controller: _controller,
            //   decoration: InputDecoration(
            //     fillColor: Colors.blue,
            //     prefixIcon: Icon(Icons.archive_rounded),
            //     hintText: 'Enter data',
            //     border:
            //     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_tree),
                    hintText: '${id}${id}${color}',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // save();
                // Storeddata();
              },
              child: Text("Save"),
            ),
            ElevatedButton(
              onPressed: () {
                // retrive();
              },
              child: Text("Retrive"),
            ),
            ElevatedButton(
              onPressed: () {
                // delete();
              },
              child: Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
  save() async {
    prefs.setString('text', _controller.text.toString());
  }

  retrive() async {
    setState(() {
      nameis = prefs.getString('text')!;
    });
  }

  delete() async {
    prefs.remove('text');
    nameis = "";
    setState(() {});
  }
}

