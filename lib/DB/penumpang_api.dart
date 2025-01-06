import 'dart:convert';

import 'package:http/http.dart';
import 'package:tugas_akhir/model/penumpang_api_model.dart';
class PenumpangApi {

  String baseUrl = "http://apibus.rngrelic.my.id/api/users";
  var client = Client();

  Future<dynamic> getById({required String id}) async {
    var url = Uri.parse("$baseUrl/$id");
    var response = await client.get(url);
    if(response.statusCode == 200){
      print(response.body);
      return PenumpangApiModel.fromJson(jsonDecode(response.body));
    }else{
      return null;
    }
  }

  Future<dynamic> login({required String email, required String password}) async {
    var url = Uri.parse("$baseUrl/login");
    var response = await client.post(url, body: {"email": email, "password": password});
    if(response.statusCode == 200){
      // print(response.body);
      return PenumpangApiModel.fromJson(jsonDecode(response.body));
    }else{
      return null;
    }
  }

}