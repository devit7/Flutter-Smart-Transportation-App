import 'package:flutter/material.dart';

class HistoryJourney extends StatefulWidget {
  const HistoryJourney({super.key});

  @override
  State<HistoryJourney> createState() => _HistoryJourneyState();
}

class _HistoryJourneyState extends State<HistoryJourney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Journey'),
      ),
      body: ListView(
        children: const [
          JourneyCard(
            date: '15/8/2024',
            busNumber: 'Bus 1',
            fare: 'Rp.12.000',
            startStop: 'Halte 1',
            endStop: 'Halte 5',
          ),
          JourneyCard(
            date: '20/2/2024',
            busNumber: 'Bus 6',
            fare: 'Rp.12.000',
            startStop: 'Halte 1',
            endStop: 'Halte 5',
          ),
          JourneyCard(
            date: '2/1/2024',
            busNumber: 'Bus 4',
            fare: 'Rp.12.000',
            startStop: 'Halte 1',
            endStop: 'Halte 5',
          ),
        ],
      ),
    );
  }
}

class JourneyCard extends StatelessWidget {
  final String date;
  final String busNumber;
  final String fare;
  final String startStop;
  final String endStop;

  const JourneyCard({
    super.key,
    required this.date,
    required this.busNumber,
    required this.fare,
    required this.startStop,
    required this.endStop,
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
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.directions_bus),
                    const SizedBox(width: 8),
                    Text(
                      busNumber,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  fare,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  startStop,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const Icon(Icons.more_horiz),
                Text(
                  endStop,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
