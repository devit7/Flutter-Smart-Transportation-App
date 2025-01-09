import 'dart:async';
import 'package:http/http.dart';
import 'package:tugas_akhir/model/halte_api_model.dart';

class HalteApi {
  String baseUrl = "https://apibus.rngrelic.my.id/api/halte";
  var client = Client();

  Future<dynamic> get() async {
    var url = Uri.parse(baseUrl);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      // print(response.body);
      //final List<dynamic> jsonData = jsonDecode(response.body)["data"];
      return halteApiModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
