class PenumpangApiModel {
  String? id;
  String? name;
  String? password;
  String? email;
  String? noTelp;

  PenumpangApiModel({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
    required this.noTelp,
  });

  factory PenumpangApiModel.fromJson(Map<String, dynamic> json) =>
      PenumpangApiModel(
        id: json["id"],
        name: json["name"],
        password: json["password"],
        email: json["email"],
        noTelp: json["noTelp"],
      );

  @override
  String toString() {
    return 'PenumpangApiModel{id: $id, name: $name, email: $email, noTelp: $noTelp}';
  }
}
