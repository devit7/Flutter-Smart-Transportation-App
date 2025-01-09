import 'dart:convert';

class TransaksiApiModel {
  String? id;
  String? idUser;
  String? idJadwal;
  String? status;
  String? statusPenumpang;
  String? tanggalTransaksi;

  TransaksiApiModel({
    required this.id,
    required this.idUser,
    required this.idJadwal,
    required this.status,
    required this.statusPenumpang,
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
      statusPenumpang: data['statusPenumpang'].toString(),
      tanggalTransaksi: data['tanggalTransaksi'].toString(),
    );
  }
}

// Konversi dari JSON string ke List TransaksiApiModel
List<TransaksiApiModel> transaksiApiModelFromJson(String str) {
  final List<dynamic> jsonData = jsonDecode(str);
  return jsonData.map((json) => TransaksiApiModel.fromJson(json)).toList();
}

// Konversi dari List TransaksiApiModel ke JSON string
String transaksiApiModelToJson(List<TransaksiApiModel> data) {
  return jsonEncode(
    List<dynamic>.from(data.map((x) => {
          "id": x.id,
          "id_user": x.idUser,
          "id_jadwal": x.idJadwal,
          "status": x.status,
          "statusPenumpang": x.statusPenumpang,
          "tanggalTransaksi": x.tanggalTransaksi,
        })),
  );
}
