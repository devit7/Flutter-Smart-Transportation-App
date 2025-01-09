import 'dart:convert';

class ReportHistoryApiModel {
  final String id;
  final String judul;
  final String deskripsi;
  final String tanggal;
  final String? file_media;
  User user;

  ReportHistoryApiModel({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.tanggal,
    this.file_media,
    required this.user,
  });

  factory ReportHistoryApiModel.fromJson(Map<String, dynamic> json) {
    return ReportHistoryApiModel(
      id: json['id'].toString(),
      judul: json['judul'].toString(),
      deskripsi: json['deskripsi'].toString(),
      tanggal: json['tanggal'].toString(),
      file_media: json['file_media'],
      user: User.fromJson(json['user']),
    );
  }
}
class User {
  String? id;
  String? name;
  String? email;

  User({this.id, this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"]?.toString(),
      name: json["name"],
      email: json["email"],
    );
  }
}
List<ReportHistoryApiModel> reportApiModelFromJson(String str) {
  final Map<String, dynamic> jsonData = jsonDecode(str);
  final List<dynamic> data = jsonData["data"];
  return data.map((item) => ReportHistoryApiModel.fromJson(item)).toList();
}
