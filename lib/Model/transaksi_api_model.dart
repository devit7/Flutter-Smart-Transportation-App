import 'dart:convert';

class TransaksiApiModel {
  String? id;
  String? idUser;
  String? idJadwal;
  String? status;
  String? tanggalTransaksi;

  TransaksiApiModel({
    required this.id,
    required this.idUser,
    required this.idJadwal,
    required this.status,
    required this.tanggalTransaksi,
  });

  // Factory untuk membuat model dari JSON
  factory TransaksiApiModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return TransaksiApiModel(
      id: data['id'].toString(),
      idUser: data['id_user'].toString(),
      idJadwal: data['id_jadwal'].toString(),
      status: data['status'].toString(),
      tanggalTransaksi: data['tanggalTransaksi'].toString(),
    );
  }
}

// Untuk konversi dari JSON String ke List TransaksiApiModel
List<TransaksiApiModel> transaksiApiModelFromJson(String str) {
  final List<dynamic> jsonData = jsonDecode(str);
  return jsonData.map((json) => TransaksiApiModel.fromJson(json)).toList();
}

// Untuk konversi dari List TransaksiApiModel ke JSON String
String transaksiApiModelToJson(List<TransaksiApiModel> data) {
  return jsonEncode(
    List<dynamic>.from(data.map((x) => {
          "id": x.id,
          "id_user": x.idUser,
          "id_jadwal": x.idJadwal,
          "status": x.status,
          "tanggalTransaksi": x.tanggalTransaksi,
        })),
  );
}
