import 'dart:convert';

class PenumpangApiModel {
  String? id;
  String? name;
  String? password;
  String? email;
  String? noTelp;
  String? gender;

  PenumpangApiModel({
    required this.id, 
    required this.name, 
    required this.password, 
    required this.email , 
    required this.noTelp, 
    required this.gender});

  factory PenumpangApiModel.fromJson(Map<String, dynamic>json)=>
    PenumpangApiModel(id: json["id"], name: json["name"], password: json["password"], email: json["email"], noTelp: json["noTelp"], gender: json["gender"]);
  
}

List<PenumpangApiModel> penumpangApiModelFromJson(String str) =>
List<PenumpangApiModel>.from(
  jsonDecode(str).map((x)=>PenumpangApiModel.fromJson(x))
);

// String todoApiModelToJson(List<PenumpangApiModel>data)=> json.encode(List<dynamic>.from(data.map((x) => x.tojson())));