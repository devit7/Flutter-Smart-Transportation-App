import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ReportApi {
  final String baseUrl = "http://apibus.rngrelic.my.id/api/laporan";
  final String userApiUrl =
      "http://apibus.rngrelic.my.id/api/user"; // User API endpoint

  // Method to fetch user ID (example implementation, adjust as needed)
  Future<String?> getUserId() async {
    try {
      var url = Uri.parse(userApiUrl); // Adjust endpoint if necessary
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data['success'] == true && data['user'] != null) {
          return data['user']['id']
              .toString(); // Adjust key based on your API response
        } else {
          print("Error fetching user ID: ${data['message']}");
          return null;
        }
      } else {
        print("Failed to fetch user ID. Status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error fetching user ID: $e");
      return null;
    }
  }

  // Method to submit a report
  Future<dynamic> submitReport({
    required String judul,
    required String deskripsi,
    required DateTime tanggal,
    String? idUser, // Make idUser optional
    required File? fileMedia,
  }) async {
    var url = Uri.parse(baseUrl);

    try {
      // Fetch user ID if not provided
      if (idUser == null) {
        idUser = await getUserId();
        if (idUser == null) {
          return {
            "success": false,
            "message": "User ID could not be retrieved.",
          };
        }
      }

      // Format the date
      final String formattedTanggal = DateFormat('yyyy-MM-dd').format(tanggal);

      var request = http.MultipartRequest('POST', url);

      // Add fields
      request.fields['judul'] = judul;
      request.fields['deskripsi'] = deskripsi;
      request.fields['tanggal'] = formattedTanggal;
      request.fields['id_user'] = idUser;

      // Add file if exists
      if (fileMedia != null) {
        request.files.add(
          await http.MultipartFile.fromPath('file_media', fileMedia.path),
        );
      }

      // Send the request
      var response = await request.send();

      // Debug response
      print("Response status code: ${response.statusCode}");
      print("Response headers: ${response.headers}");

      // Handle non-successful responses
      if (response.statusCode != 200 && response.statusCode != 201) {
        var responseBody = await response.stream.bytesToString();
        print("Response body: $responseBody");
        return {
          "success": false,
          "message":
              "Failed to submit report. Status code: ${response.statusCode}",
          "error": responseBody,
        };
      }

      // Parse JSON response
      if (response.headers['content-type']?.contains('application/json') ==
          true) {
        var responseBody = await response.stream.bytesToString();
        return jsonDecode(responseBody);
      } else {
        var responseBody = await response.stream.bytesToString();
        print("Unexpected response format: $responseBody");
        return {
          "success": false,
          "message": "Unexpected response format.",
          "error": responseBody,
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
