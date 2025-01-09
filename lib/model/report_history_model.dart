import 'dart:convert';

class ReportHistoryApiModel {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String? imageUrl;

  ReportHistoryApiModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.imageUrl,
  });

  factory ReportHistoryApiModel.fromJson(Map<String, dynamic> json) {
    return ReportHistoryApiModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'image_url': imageUrl,
    };
  }
}

List<ReportHistoryApiModel> reportApiModelFromJson(String str) {
  final jsonData = json.decode(str);
  return List<ReportHistoryApiModel>.from(
    jsonData.map((item) => ReportHistoryApiModel.fromJson(item)),
  );
}

String reportApiModelToJson(List<ReportHistoryApiModel> data) {
  final jsonData = data.map((item) => item.toJson()).toList();
  return json.encode(jsonData);
}
