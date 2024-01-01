import 'dart:convert';

import 'package:covid_19_app/Services/Utilities/ApiLinks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountriesClass {
  Future<List<dynamic>> getCountriesStats() async {
    var data;
    final response = await http.get(Uri.parse(ApiLinksClass.countryStatsLink));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      return data;
    } else {
      return data;
    }
  }
}
