import 'dart:convert';

import 'package:http/http.dart';
import 'package:tugas_akhir/model/transaksi_hisotry.dart';

class TransaksiHistory {
  String baseUrl =
      "https://apibus.rngrelic.my.id/api/transaksi/user";
  //String baseUrl = "https://0c0f-182-253-50-62.ngrok-free.app/api/users";
  var client = Client();

  Future<dynamic> getByIdUser({required String id}) async {
    var url = Uri.parse("$baseUrl/$id");
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        print("Response Body Transaksi Hist: " + response.body);
        return transaksiHistoryModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print("Error occurred: $e");
      return {
        "success": false,
        "message": "An error occurred: $e",
      };
    }
  }
}
