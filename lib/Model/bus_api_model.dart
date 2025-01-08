class BusApiModel {
  String? id;
  String? namaBus;
  String? kapasitasPenumpang;
  int? harga;

  BusApiModel({
    this.id,
    this.namaBus,
    this.kapasitasPenumpang,
    this.harga,
  });

  factory BusApiModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return BusApiModel(
      id: data['id'].toString(),
      namaBus: data['namaBus'].toString(),
      kapasitasPenumpang: data['kapasitasPenumpang'],
      harga: data['harga'],
    );
  }
}
