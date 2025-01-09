import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:tugas_akhir/model/penumpang_api_model.dart';

class PenumpangApi {
  String baseUrl = "http://apibus.rngrelic.my.id/api/users";
  //String baseUrl = "https://0c0f-182-253-50-62.ngrok-free.app/api/users";
  var client = Client();

  Future<dynamic> getById({required String id}) async {
    var url = Uri.parse("$baseUrl/$id");
    var response = await client.get(url);

    if (response.statusCode == 200) {
      print(response.body);

      return PenumpangApiModel.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<dynamic> update({
    required String id,
    required String name,
    required String noTelp,
    required String alamat,
    required File? img, // Bisa null
    required String email,
  }) async {
    var url = Uri.parse("$baseUrl/$id");

    try {
      // Buat request multipart
      var request = http.MultipartRequest('POST', url);

      // Tambahkan data form
      request.fields['name'] = name;
      request.fields['noTelp'] = noTelp;
      request.fields['alamat'] = alamat;
      request.fields['email'] = email;
      request.fields['_method'] = 'PUT';

      // Tambahkan file ke request jika img tidak null
      if (img != null) {
        request.files.add(await http.MultipartFile.fromPath('img', img.path));
      }

      // Kirim request
      var response = await request.send();

      // Cek status response
      if (response.statusCode == 200) {
        var responseBody = await http.Response.fromStream(response);
        print("Success: ${responseBody.body}");
        return responseBody.body; // Atau sesuaikan parsing ke model Anda
      } else {
        print("Failed to update. Status code: ${response.statusCode}");
        return {
          "success": false,
          "message": "Failed to update. Status code: ${response.statusCode}",
        };
      }
    } catch (e) {
      print("Error occurred: $e");
      return {
        "success": false,
        "message": "An error occurred: $e",
      };
    }
  }

  Future<dynamic> register({required Map<String, dynamic> data}) async {
    var url = Uri.parse(baseUrl);

    try {
      var response = await client.post(
        url,
        body: jsonEncode(data),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body); // Parsing JSON respons
      } else {
        return jsonDecode(response.body); // Untuk menampilkan pesan error
      }
    } catch (e) {
      throw Exception("Failed to connect to API: $e");
    }
  }
}
