class PenumpangApiModel {
  String? id;
  String? name;
  String? password;
  String? email;
  String? noTelp;
  String? alamat;
  String? img;


  PenumpangApiModel({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
    required this.noTelp,
    required this.alamat,
    required this.img
  });

  factory PenumpangApiModel.fromJson(Map<String, dynamic> json) =>
      PenumpangApiModel(
        id: json["id"],
        name: json["name"],
        password: json["password"],
        email: json["email"],
        noTelp: json["noTelp"],
        alamat: json["alamat"],
        img: json["img"],
      );

  @override
  String toString() {
    return 'PenumpangApiModel{id: $id, name: $name, email: $email, noTelp: $noTelp}';
  }
}
