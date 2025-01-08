import 'dart:convert';

class AuthModel {
  String? id;
  String? name;
  String? password;
  String? email;
  String? noTelp;
  String? alamat;
  String? img;
  AuthModel(
      {required this.id,
      required this.name,
      required this.password,
      required this.email,
      required this.noTelp,
      required this.alamat,
      required this.img});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    final data = json['user'];
    return AuthModel(
      id: data["id"].toString(),
      name: data["name"].toString(),
      password: data["password"],
      email: data["email"],
      noTelp: data["noTelp"],
      alamat: data["alamat"],
      img: data["img"],
    );
  }
}

List<AuthModel> penumpangApiModelFromJson(String str) {
  final List<dynamic> jsonData = jsonDecode(str);
  return jsonData.map((json) => AuthModel.fromJson(json)).toList();
}


// String todoApiModelToJson(List<PenumpangApiModel>data)=> json.encode(List<dynamic>.from(data.map((x) => x.tojson())));