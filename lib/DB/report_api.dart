import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tugas_akhir/Model/report_api_model.dart'; // Import your model

class ReportApi {
  final String baseUrl =
      "http://apibus.rngrelic.my.id/admin/laporans"; // Replace with your actual API URL
  final http.Client client;

  ReportApi({http.Client? client}) : client = client ?? http.Client();

  Future<dynamic> submitReport({
    required String judul,
    required String deskripsi,
    required DateTime tanggal,
    required File? file_media,
  }) async {
    var url = Uri.parse(baseUrl);
    try {
      var request = http.MultipartRequest('POST', url);

      // Add fields to the request
      request.fields['title'] = judul;
      request.fields['description'] = deskripsi;
      request.fields['date'] = tanggal.toIso8601String();

      // Add image file if it exists
      if (file_media != null) {
        request.files
            .add(await http.MultipartFile.fromPath('image', file_media.path));
      }

      // Send the request
      var response = await request.send();

      // Check the response status
      if (response.statusCode == 201) {
        var responseBody = await http.Response.fromStream(response);
        print("Success: ${responseBody.body}");
        return jsonDecode(
            responseBody.body); // Adjust according to your response structure
      } else {
        print("Failed to submit report. Status code: ${response.statusCode}");
        return {
          "success": false,
          "message":
              "Failed to submit report. Status code: ${response.statusCode}",
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
}
