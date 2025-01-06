import 'dart:convert';

class PenumpangApiModel {
  String? idPenumpang;
  String? name;
  String? password;
  String? email;
  String? noTelp;
  String? gender;

  PenumpangApiModel({
    required this.idPenumpang, 
    required this.name, 
    required this.password, 
    required this.email , 
    required this.noTelp, 
    required this.gender});

  factory PenumpangApiModel.fromJson(Map<String, dynamic>json)=>
    PenumpangApiModel(idPenumpang: json["idPenumpang"], name: json["name"], password: json["password"], email: json["email"], noTelp: json["noTelp"], gender: json["gender"]);
  
}

PenumpangApiModel penumpangApiModelFromJson(String str) =>
    PenumpangApiModel.fromJson(jsonDecode(str));

// String todoApiModelToJson(List<PenumpangApiModel>data)=> json.encode(List<dynamic>.from(data.map((x) => x.tojson())));