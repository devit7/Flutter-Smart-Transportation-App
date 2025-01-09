import 'dart:convert';

class HalteApiModel {
  String? id;
  String? namaHalte;

  HalteApiModel({required this.id, required this.namaHalte});

  factory HalteApiModel.fromJson(Map<String, dynamic> json) {
    //final data = json['data'];
    return HalteApiModel(
      id: json["id"]?.toString(),
      namaHalte: json["namaHalte"] ?? "",
    );
  }
}

List<HalteApiModel> halteApiModelFromJson(String str) {
  final Map<String, dynamic> jsonData = jsonDecode(str);
  final List<dynamic> data = jsonData["data"];
  return data.map((item) => HalteApiModel.fromJson(item)).toList();
}
