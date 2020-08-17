import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetInformation {
  final String url;
  GetInformation({this.url});
  Future getData() async {
    http.Response response = await http.get('https://api.covid19api.com/$url');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
