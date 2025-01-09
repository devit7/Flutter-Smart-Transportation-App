import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:tugas_akhir/Model/halte_api_model.dart';

class HalteApi {
  String baseUrl = "http://apibus.rngrelic.my.id/api/jhalte";
  var client = Client();

  List<HalteApiModel> busList = [];

  Future<dynamic> getHalte() async {
    var url = Uri.parse(baseUrl);
    final response = await client.get(url);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // print("HalteApi.getBus() - jsonDecode");
      // print(data['data']);
      for (Map dataBus in data['data']) {
        busList.add(HalteApiModel.fromJson(dataBus));
      }
      return busList;
    } else {
      return busList;
    }
  }
}
