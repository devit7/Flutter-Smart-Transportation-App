import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ReportApi {
  final String baseUrl = "http://apibus.rngrelic.my.id/api/laporan";
  final http.Client client;

  ReportApi({http.Client? client}) : client = client ?? http.Client();

  Future<dynamic> submitReport({
    required String judul,
    required String deskripsi,
    required DateTime tanggal,
    required String idUser,
    required File? fileMedia,
  }) async {
    var url = Uri.parse(baseUrl);
    try {
      var request = http.MultipartRequest('POST', url);

      // Add fields to the request
      request.fields['judul'] = judul;
      request.fields['deskripsi'] = deskripsi;
      request.fields['tanggal'] = tanggal.toIso8601String();
      request.fields['id_user'] = idUser;

      // Add image file if it exists
      if (fileMedia != null) {
        request.files.add(
            await http.MultipartFile.fromPath('file_media', fileMedia.path));
      }

      // Send the request
      var response = await request.send();

      if (response.statusCode == 201) {
        var responseBody = await http.Response.fromStream(response);
        return jsonDecode(responseBody.body);
      } else {
        return {
          "success": false,
          "message":
              "Failed to submit report. Status code: ${response.statusCode}",
        };
      }
    } catch (e) {
      return {
        "success": false,
        "message": "An error occurred: $e",
      };
    }
  }
}
