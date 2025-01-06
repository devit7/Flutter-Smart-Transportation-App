import 'dart:convert';

class PenumpangApiModel {
  String? id;
  String? name;
  String? password;
  String? email;
  String? noTelp;
  String? alamat;

  PenumpangApiModel({
    
    required this.id, 
    required this.name, 
    required this.password, 
    required this.email , 
    required this.noTelp,
    required this.alamat});

  factory PenumpangApiModel.fromJson(Map<String, dynamic>json){
    final data = json['data'];
    return PenumpangApiModel(id: data["id"].toString(), name: data["name"].toString(), password: json["password"], email: json["email"], noTelp: json["noTelp"], alamat: json["alamat"]);
  }
}

List<PenumpangApiModel> penumpangApiModelFromJson(String str) {
  final List<dynamic> jsonData = jsonDecode(str);
  return jsonData.map((json) => PenumpangApiModel.fromJson(json)).toList();
}


// String todoApiModelToJson(List<PenumpangApiModel>data)=> json.encode(List<dynamic>.from(data.map((x) => x.tojson())));