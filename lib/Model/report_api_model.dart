class ReportApiModel {
  final String idUser;
  final String judul;
  final String deskripsi;
  final DateTime tanggal;
  final String fileMedia;

  ReportApiModel({
    required this.idUser,
    required this.judul,
    required this.deskripsi,
    required this.tanggal,
    required this.fileMedia,
  });

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'judul': judul,
      'deskripsi': deskripsi,
      'tanggal': tanggal.toIso8601String(),
      'file_media': fileMedia,
    };
  }
}
