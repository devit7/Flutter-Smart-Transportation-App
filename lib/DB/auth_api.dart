import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tugas_akhir/model/auth_model.dart';

class AuthApi {
  String baseUrl = "https://apibus.rngrelic.my.id/api/";
 var client = http.Client();

    Future<dynamic> login({
      required String email, 
      required String password
      }) async {
    var url = Uri.parse("$baseUrl/login");
    var response =
        await client.post(url, body: {"email": email, "password": password});
    if (response.statusCode == 200) {
      // print("halo login e jalan");
      // print(response.body);
      return AuthModel.fromJson(jsonDecode(response.body));
    } else {
      // print("halo login e ga jalan status code = ${response.statusCode} body = ${response.body}");
      return null;
    }
  }

}