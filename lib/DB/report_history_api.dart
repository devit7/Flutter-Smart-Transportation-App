import 'dart:convert';
import 'package:http/http.dart';
import 'package:tugas_akhir/model/report_history_model.dart';

class ReportHistoryApi {
  String baseUrl = "http://apibus.rngrelic.my.id/api/laporan/user";
  var client = Client();

  Future<dynamic> getByIdUser({required String id}) async {
    var url = Uri.parse("$baseUrl/$id");
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        //print(response.body);
        return reportApiModelFromJson(response.body);
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
