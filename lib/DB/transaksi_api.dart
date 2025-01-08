import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class TransaksiApi {
  String baseUrl = "http://apibus.rngrelic.my.id/api/transaksi";
  var client = Client();

  // CREATE Transaksi Baru
  Future<dynamic> create({
    required String idUser,
    required String idJadwal,
    required String status,
    required String tanggalTransaksi,
  }) async {
    var url = Uri.parse(baseUrl);
    try {
      var response = await client.post(
        url,
        body: jsonEncode({
          "id_user": idUser,
          "id_jadwal": idJadwal,
          "status": status,
          "tanggalTransaksi": tanggalTransaksi,
        }),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception("Failed to create transaction: $e");
    }
  }

  // UPDATE Status Transaksi
  Future<dynamic> updateStatus({
    required String id,
    required String status,
  }) async {
    var url = Uri.parse("$baseUrl/$id");
    try {
      var response = await client.put(
        url,
        body: jsonEncode({
          "status": status,
        }),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {
          "success": false,
          "message":
              "Failed to update status. Status code: ${response.statusCode}",
        };
      }
    } catch (e) {
      throw Exception("Failed to update status: $e");
    }
  }
}
