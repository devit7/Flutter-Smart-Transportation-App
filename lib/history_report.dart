import 'package:flutter/material.dart';

class HistoryReport extends StatefulWidget {
  const HistoryReport({super.key});

  @override
  State<HistoryReport> createState() => _HistoryReportState();
}

class _HistoryReportState extends State<HistoryReport> {
  final List<Map<String, String>> reportData = [
    {
      'date': '15/8/2024',
      'title': 'Pengemudi Mengantuk',
      'content':
          'Mengantuk saat mengemudi dapat berakibat fatal. Studi menunjukkan bahwa tingkat kecelakaan yang disebabkan oleh pengemudi yang mengantuk hampir setara dengan kecelakaan akibat pengemudi mabuk.',
    },
    {
      'date': '20/8/2024',
      'title': 'Kekerasan Verbal',
      'content':
          'Kekerasan verbal adalah bentuk kekerasan yang menggunakan kata-kata untuk menyakiti, merendahkan, atau mengintimidasi orang lain. Ini bisa terjadi dalam berbagai konteks, seperti di rumah, sekolah, tempat kerja, atau bahkan di ruang publik. Kekerasan verbal dapat berupa penghinaan, ancaman, ejekan, atau komentar yang merendahkan.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History Report',
        ),
      ),
      body: ListView.builder(
        itemCount: reportData.length,
        itemBuilder: (context, index) {
          final item = reportData[index];
          return ReportCard(
            date: item['date']!,
            title: item['title']!,
            content: item['content']!,
          );
        },
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final String date;
  final String title;
  final String content;

  const ReportCard({
    super.key,
    required this.date,
    required this.title,
    required this.content,
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
              'Date : $date',
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
          ],
        ),
      ),
    );
  }
}
