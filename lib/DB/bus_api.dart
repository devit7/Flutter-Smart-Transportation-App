import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:tugas_akhir/model/bus_api_model.dart';

class BusApi {
  String baseUrl = "http://apibus.rngrelic.my.id/api/jadwal";
  var client = Client();

  List<BusApiModel> busList = [];

  Future<dynamic> getBus() async {
    var url = Uri.parse(baseUrl);
    final response = await client.get(url);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // print("BusApi.getBus() - jsonDecode");
      // print(data['data']);
      for (Map dataBus in data['data']) {
        busList.add(BusApiModel.fromJson(dataBus));
      }
      return busList;
    } else {
      return busList;
    }
  }
}
