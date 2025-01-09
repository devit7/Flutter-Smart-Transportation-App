import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:tugas_akhir/Model/halte_api_model.dart';

class HalteApi {
  String baseUrl = "https://apibus.rngrelic.my.id/api/halte";
  var client = Client();

  Future<dynamic> get() async {
    var url = Uri.parse(baseUrl);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      // print(response.body);
      final List<dynamic> jsonData = jsonDecode(response.body)["data"];
      return jsonData.map((json) => HalteApiModel.fromJson(json)).toList();
    } else {
      return null;
    }
  }
}
