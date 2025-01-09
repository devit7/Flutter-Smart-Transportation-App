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
      id: data["id"],
      namaHalte: data["namaHalte"],
    );
  }
  // Map<String, dynamic> tojson() => {"namaHalte": namaHalte, "id": id};

}

List<HalteApiModel> halteApiModelFromJson(String str) => List<HalteApiModel>.from(
    jsonDecode(str).map((x) => HalteApiModel.fromJson(x))).toList();
