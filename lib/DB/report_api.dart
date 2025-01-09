import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' show DateFormat;

class ReportApi {
  final String baseUrl = "http://apibus.rngrelic.my.id/api/laporan";

  Future<dynamic> submitReport({
    required String judul,
    required String deskripsi,
    required DateTime tanggal,
    required String idUser,
    required File? fileMedia,
  }) async {
    var url = Uri.parse(baseUrl);

    try {
      // Format tanggal sesuai kebutuhan backend
      final String formattedTanggal = DateFormat('yyyy-MM-dd').format(tanggal);

      var request = http.MultipartRequest('POST', url);

      // Add fields to the request
      request.fields['judul'] = judul;
      request.fields['deskripsi'] = deskripsi;
      request.fields['tanggal'] = formattedTanggal; // Formatted date
      request.fields['id_user'] = idUser;

      // Add image file if it exists
      if (fileMedia != null) {
        request.files.add(
            await http.MultipartFile.fromPath('file_media', fileMedia.path));
      }

      // Send the request
      var response = await request.send();

      // Check the response status
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseBody = await http.Response.fromStream(response);

        // Check if the response is JSON
        if (responseBody.headers['content-type']
                ?.contains('application/json') ==
            true) {
          return jsonDecode(responseBody.body);
        } else {
          return {
            "success": false,
            "message": "Unexpected response format: ${responseBody.body}",
          };
        }
      } else {
        // Handle non-successful responses
        var responseBody = await http.Response.fromStream(response);
        return {
          "success": false,
          "message":
              "Failed to submit report. Status code: ${response.statusCode}",
          "error": responseBody.body, // Include error details if available
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
