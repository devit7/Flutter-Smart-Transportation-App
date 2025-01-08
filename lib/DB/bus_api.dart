import 'dart:async';
import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:tugas_akhir/model/bus_api_model.dart';

class BusApi {
  String baseUrl = "http://apibus.rngrelic.my.id/api/jadwal";
  var client = Client();
  Future<dynamic> getBus() async {
    var url = Uri.parse(baseUrl);
    var response = await client.get(url); 
    if (response.statusCode == 200) {
      // print("BusApi.getBus()");
      // print(response.body);
      return BusApiModel.fromJson(jsonDecode(response.body));
    } else {
      return null;
    } 
  }
}
