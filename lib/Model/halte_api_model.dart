import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';

class HalteApiModel {
  int id;
  String namaHalte;

  HalteApiModel({required this.id, required this.namaHalte});

  factory HalteApiModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return HalteApiModel(
      id: data["id"] is int
          ? data["id"]
          : int.tryParse(data["id"].toString()) ?? 0,
      namaHalte: data["namaHalte"] ?? "",
    );
  }
}

List<HalteApiModel> penumpangApiModelFromJson(String str) {
  final List<dynamic> jsonData = jsonDecode(str);
  return jsonData.map((json) => HalteApiModel.fromJson(json)).toList();
}
