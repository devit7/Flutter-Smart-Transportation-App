import 'package:flutter/material.dart';
import 'package:tugas_akhir/DB/report_history_api.dart';
import 'package:tugas_akhir/model/report_history_model.dart';

class HistoryReport extends StatefulWidget {
  const HistoryReport({super.key});

  @override
  State<HistoryReport> createState() => _HistoryReportState();
}

class _HistoryReportState extends State<HistoryReport> {
  Future<dynamic>? Reporthistory;
  final reportHistory = ReportHistoryApi();

  @override
  void initState() {
    super.initState();
    getReporthistory();
  }

  void getReporthistory() {
    setState(() {
      Reporthistory = reportHistory.getByIdUser(id: "9");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 26, 42, 69),
        title: const Text('History Report'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: FutureBuilder<dynamic>(
        future: Reporthistory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Data Found'));
          }

          final List<ReportHistoryApiModel> reports = snapshot.data!;

          return ListView.builder(
            itemCount: reports.length,
            itemBuilder: (context, index) {
              final report = reports[index];
              return ReportCard(
                date: report.date ?? DateTime.now(),
                title: report.title ?? "No Title",
                content: report.description ?? "No Content",
                imageUrl: report.imageUrl,
              );
            },
          );
        },
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final DateTime date;
  final String title;
  final String content;
  final String? imageUrl;

  const ReportCard({
    super.key,
    required this.date,
    required this.title,
    required this.content,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date : ${date.toLocal().toString().split(' ')[0]}', // Displaying the date in YYYY-MM-DD format
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Colors.black54,
              ),
            ),
            if (imageUrl != null) ...[
              const SizedBox(height: 8),
              Image.network(imageUrl!),
            ],
          ],
        ),
      ),
    );
  }
}
