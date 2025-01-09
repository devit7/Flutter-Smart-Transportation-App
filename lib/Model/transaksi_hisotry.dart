import 'dart:convert';

class TransaksiHistoryModel {
  String? id;
  String? idUser;
  String? idJadwal;
  String? status;
  String? statusPenumpang;
  String? tanggalTransaksi;
  User? user;
  Jadwal? jadwal;

  TransaksiHistoryModel({
    this.id,
    this.idUser,
    this.idJadwal,
    this.status,
    this.statusPenumpang,
    this.tanggalTransaksi,
    this.user,
    this.jadwal,
  });

  factory TransaksiHistoryModel.fromJson(Map<String, dynamic> json) {
    return TransaksiHistoryModel(
      id: json["id"]?.toString(),
      idUser: json["id_user"]?.toString(),
      idJadwal: json["id_jadwal"]?.toString(),
      status: json["status"],
      statusPenumpang: json["statusPenumpang"],
      tanggalTransaksi: json["tanggalTransaksi"],
      user: json["user"] != null ? User.fromJson(json["user"]) : null,
      jadwal: json["jadwal"] != null ? Jadwal.fromJson(json["jadwal"]) : null,
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

class Jadwal {
  String? id;
  String? waktuBerangkat;
  Bus? bus;
  Halte? halte;

  Jadwal({this.id, this.waktuBerangkat, this.bus, this.halte});

  factory Jadwal.fromJson(Map<String, dynamic> json) {
    return Jadwal(
      id: json["id"]?.toString(),
      waktuBerangkat: json["waktuBerangkat"],
      bus: json["bus"] != null ? Bus.fromJson(json["bus"]) : null,
      halte: json["halte"] != null ? Halte.fromJson(json["halte"]) : null,
    );
  }
}

class Bus {
  String? id;
  String? namaBus;
  String? harga;

  Bus({this.id, this.namaBus, this.harga});

  factory Bus.fromJson(Map<String, dynamic> json) {
    return Bus(
      id: json["id"]?.toString(),
      namaBus: json["namaBus"],
      harga: json["harga"]?.toString(),
    );
  }
}

class Halte {
  String? id;
  String? namaHalte;
  String? lokasiHalte;

  Halte({this.id, this.namaHalte, this.lokasiHalte});

  factory Halte.fromJson(Map<String, dynamic> json) {
    return Halte(
      id: json["id"]?.toString(),
      namaHalte: json["namaHalte"],
      lokasiHalte: json["lokasiHalte"],
    );
  }
}


List<TransaksiHistoryModel> transaksiHistoryModelFromJson(String str) {
  final Map<String, dynamic> jsonData = jsonDecode(str);
  final List<dynamic> data = jsonData["data"];
  return data.map((item) => TransaksiHistoryModel.fromJson(item)).toList();
}
