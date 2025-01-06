import 'dart:convert';

class Penumpang {
  String id;
  String name;
  String email;
  String noTelp;
  String alamat;
  String img;

  Penumpang({required this.id, required this.name, required this.email, required this.noTelp, required this.alamat, required this.img});

  factory Penumpang.fromJson(Map<String, dynamic> json) => Penumpang(
    id: json['id'], 
    name: json['name'], 
    email: json['email'], 
    noTelp: json['noTelp'], 
    alamat: json['alamat'], 
    img: json['img']
    );
  
  Map<String, dynamic> toJson() => {
    'id': id, 
    'name': name, 
    'email': email, 
    'noTelp': noTelp, 
    'alamat': alamat, 
    'img': img
  };

  List<Penumpang> penumpangfromJson(String str) => 
  List<Penumpang>.from(
    json.decode(str).map((x) => Penumpang.fromJson(x)));

    String penumpangToJson(List<Penumpang> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}