import 'package:flutter/material.dart';
import 'package:tugas_akhir/DB/transaksi_history.dart';
import 'package:tugas_akhir/model/transaksi_hisotry.dart';

class HistoryJourney extends StatefulWidget {
  const HistoryJourney({super.key, required this.idUser});
  final String idUser;

  @override
  State<HistoryJourney> createState() => _HistoryJourneyState();
}

class _HistoryJourneyState extends State<HistoryJourney> {
  Future<dynamic>? transaksiHistory;
  final transaksiApi = TransaksiHistory();

  @override
  void initState() {
    super.initState();
    getTransaksiUser();
  }

  void getTransaksiUser() {
    setState(() {
      transaksiHistory = transaksiApi.getByIdUser(id: "9");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 26, 42, 69),
        title: const Text('History Journey'),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder(
        future: transaksiHistory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null) {
            return const Center(child: Text('No Data Found'));
          }

          final List<TransaksiHistoryModel> historyTransaksi = snapshot.data;
          
          return ListView.separated(
            itemBuilder: (context, index) {
              final dataTH = historyTransaksi[index];
              final bus = dataTH.jadwal?.bus;
              final halte = dataTH.jadwal?.halte;

              return JourneyCard(
                date: dataTH.tanggalTransaksi ?? "Unknown Date",
                busNumber: bus?.namaBus ?? "Unknown Bus",
                fare: 'Rp.${bus?.harga ?? "0"}',
                startStop: halte?.namaHalte ?? "Unknown Stop",
                status: dataTH.statusPenumpang ?? "Unknown Status",
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 5),
            itemCount: historyTransaksi.length,
          );
        },
      ),
    );
  }
}

class JourneyCard extends StatelessWidget {
  final String date;
  final String busNumber;
  final String fare;
  final String startStop;
  final String status;

  const JourneyCard({
    super.key,
    required this.date,
    required this.busNumber,
    required this.fare,
    required this.startStop,
    required this.status,
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
                  status,
                  style: TextStyle(
                      color: status == 'in' ? Colors.green : Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
