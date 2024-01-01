import 'dart:convert';

import 'package:covid_19_app/Models/WorldStatsModel.dart';
import 'package:covid_19_app/Services/Utilities/ApiLinks.dart';
import 'package:http/http.dart' as http;

class WorldStatsClass {


Future<WorldStatsModel> getDataWorldStats() async {
  final response = await http.get(Uri.parse(ApiLinksClass.worldStatsLink.toString()));

  var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200) {

      return WorldStatsModel.fromJson(data);
    } else{
throw Exception('Error');

    }


}




}



















