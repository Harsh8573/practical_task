import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practical_harsh/main/strings.dart';

import '../Model/Product_Data.dart';
import 'apidata.dart';
import '../Model/product_detail.dart';

Future<Apidata> fetchapi() async {
  // final slug = 'govadiyo';
  // final url = Uri.encodeFull('https://reqres.in/api/unknown/${slug}');
  // print(url);
  final response = await http.get(Uri.parse('https://reqres.in/api/unknown/3'));
  if (response.statusCode == 200) {
    return Apidata.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(Strings.failed_to_load);
  }
}

class ProductListapi extends StatefulWidget {
  const ProductListapi({Key? key}) : super(key: key);

  @override
  _ProductListapiState createState() => _ProductListapiState();
}

class _ProductListapiState extends State<ProductListapi> {
  late Future<Apidata> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchapi();
  }

  @override
  Widget build(BuildContext context) {
    final addpath = 'harsh';
    final url = Uri.encodeFull('https://runknown/${addpath}');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(url),
      ),
      body: Center(
        child: FutureBuilder<Apidata>(
          future: futureAlbum,
          builder: (context, snapshot) {

            // final users = snapshot.data?.data?.id.toString();
            //   // var i ="";
            // final List<String> descrip = [];
            // for(var i = 0;i < users; i++){
            //
            //   descrip.add(users!);
            // }
            if (snapshot.hasData) {
              return Container(
                child: ListView.builder(
                  itemCount: 1,
                  // snapshot.data == null ? 0 : snapshot.data?.data?.length,
                  itemBuilder: (context, index) {
                    // var color = "0xFF" +
                    //     snapshot.data!.data![index].color!.substring(1, 7);
                    // var value = Color(int.parse(color));
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                id:snapshot.data!.data!.id,
                                color:snapshot.data!.data!.color,
                                name: snapshot.data!.data!.name!.toString(),
                              ),
                            ),
                          );
                        },
                        child: Card(
                            child: ListTile(
                              leading: Text(snapshot.data!.data!.id.toString()),
                              title: Text(snapshot.data!.data!.name!.toString()),
                              subtitle: Text(
                                snapshot.data!.data!.year!.toString(),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  height: 60,
                                  width: 75,
                                  // color: value,
                                  child: Center(
                                    child: Text(
                                      '${snapshot.data!.data!.color?.substring(1, 7)}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                  ),
                                ),
                              ),
                              isThreeLine: true,
                              dense: false,
                            )),
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
