import 'dart:convert';

class HalteApiModel {
  String idJadwal;
  String idHalte;
  String idBus;
  String waktuBerangkat;
  String namaHalte;
  String lokasiHalte;
  String namaBus;
  int kapasitasPenumpang;
  int harga;

  HalteApiModel({
    required this.idJadwal,
    required this.idHalte,
    required this.idBus,
    required this.waktuBerangkat,
    required this.namaHalte,
    required this.lokasiHalte,
    required this.namaBus,
    required this.kapasitasPenumpang,
    required this.harga,
  });

  factory HalteApiModel.fromJson(dynamic json) {
    final data = json;
    print("\n");
    print("HalteApiModel.fromJson");
    print(data);

    return HalteApiModel(
      idJadwal: data['id'].toString(),
      idHalte: data['halte']['id'].toString(),
      idBus: data['bus']['id'].toString(),
      waktuBerangkat: data['waktuBerangkat'].toString(),
      namaHalte: data['halte']['namaHalte'].toString(),
      lokasiHalte: data['halte']['lokasiHalte'].toString(),
      namaBus: data['bus']['namaBus'].toString(),
      kapasitasPenumpang: data['bus']['kapasitasPenumpang'],
      harga: data['bus']['harga'],
    );
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idJadwal'] = idJadwal;
    map['idHalte'] = idHalte;
    map['idBus'] = idBus;
    map['waktuBerangkat'] = waktuBerangkat;
    map['namaHalte'] = namaHalte;
    map['lokasiHalte'] = lokasiHalte;
    map['namaBus'] = namaBus;
    map['kapasitasPenumpang'] = kapasitasPenumpang;
    map['harga'] = harga;
    return map;
  }
}

// List<HalteApiModel> busApiModelFromJson(String str) {
//   final List<dynamic> jsonData = jsonDecode(str);
//   return jsonData.map((json) => BusApiModel.fromJson(json)).toList();
// }
