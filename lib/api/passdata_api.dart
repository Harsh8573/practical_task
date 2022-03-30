import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../main/strings.dart';
import 'apidata.dart';

Future<Apidata> fetchapi() async {

  final response = await http.get(Uri.parse('https://reqres.in/api/unknown/3'));
  if (response.statusCode == 200) {
    return Apidata.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(Strings.failed_to_load);
  }
}
