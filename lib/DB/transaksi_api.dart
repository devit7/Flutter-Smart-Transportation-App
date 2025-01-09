import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class TransaksiApi {
  final String baseUrl = "http://apibus.rngrelic.my.id/api/transaksi";

  Future<dynamic> create({
    required String idUser,
    required String idJadwal,
    required String status,
    required String statusPenumpang,
    required DateTime tanggalTransaksi,
  }) async {
    var url = Uri.parse(baseUrl);

    try {
      // Format tanggal sesuai kebutuhan backend
      final String formattedTanggalTransaksi =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(tanggalTransaksi);

      final response = await http.post(
        url,
        body: jsonEncode({
          'id_user': idUser,
          'id_jadwal': idJadwal,
          'status': status, // Hanya menerima "success" atau "cancel"
          'statusPenumpang': statusPenumpang,
          'tanggalTransaksi': formattedTanggalTransaksi,
        }),
        headers: {
          "Content-Type": "application/json", // Header JSON
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        print("Error: ${response.body}");
        return null;
      }
    } catch (e) {
      throw Exception("Failed to create transaction: $e");
    }
  }

  Future<bool> update(
      {required String id, required String statusPenumpang}) async {
    try {
      final response = await http.put(
        Uri.parse("$baseUrl/$id"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "statusPenumpang": statusPenumpang,
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print("Failed to update: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}
