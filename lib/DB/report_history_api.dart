import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tugas_akhir/model/report_history_model.dart';

class ReportHistoryApi {
  String baseUrl = "http://apibus.rngrelic.my.id/api/laporan";
  var client = http.Client();

  Future<dynamic> getByIdUser({required String id}) async {
    var url = Uri.parse("$baseUrl");
    var request = http.MultipartRequest('GET', url);

    request.fields['id'] = id;
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        print("Response Body report:" + response.body);
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
