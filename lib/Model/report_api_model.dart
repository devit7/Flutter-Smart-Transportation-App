class ReportApiModel {
  final String title;
  final String description;
  final DateTime date;
  final String imageUrl;

  ReportApiModel({
    required this.title,
    required this.description,
    required this.date,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'imageUrl': imageUrl,
    };
  }
}
