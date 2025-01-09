import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas_akhir/DB/transaksi_api.dart';
import 'package:tugas_akhir/dashboard.dart';
import 'package:tugas_akhir/konfirmasi_page.dart'; // Import KonfirmasiPage

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({Key? key}) : super(key: key);

  @override
  _TransaksiPageState createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  final TextEditingController idUserController = TextEditingController();
  final TextEditingController idJadwalController = TextEditingController();
  final TextEditingController statusPenumpangController =
      TextEditingController(text: "in");
  final List<String> statusList = ["success", "cancel"];
  String? selectedStatus;
  DateTime? selectedDate;

  Future<void> saveTransaction() async {
    if (selectedStatus == null || selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    try {
      final response = await TransaksiApi().create(
        idUser: idUserController.text,
        idJadwal: idJadwalController.text,
        status: selectedStatus!,
        statusPenumpang: statusPenumpangController.text,
        tanggalTransaksi: selectedDate!,
      );

      if (response != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Transaction created successfully")),
        );

        // Navigate to KonfirmasiPage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                KonfirmasiPage(id: "1"), // Gunakan ID transaksi
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to create transaction")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2A45),
        title: const Text(
          "Transaksi",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Dashboard(idUser: "2",)));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: idUserController,
              decoration: const InputDecoration(
                labelText: "ID User",
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: idJadwalController,
              decoration: const InputDecoration(
                labelText: "ID Jadwal",
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: selectedStatus,
              items: statusList
                  .map((status) => DropdownMenuItem(
                        value: status,
                        child: Text(status,
                            style: const TextStyle(color: Colors.black)),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedStatus = value;
                });
              },
              decoration: const InputDecoration(
                labelText: "Status",
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: statusPenumpangController,
              decoration: const InputDecoration(
                labelText: "Status Penumpang",
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
              enabled: false, // Disabled input
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color(0xFF1A2A45),
                ),
                onPressed: pickDate,
                child: Text(
                  selectedDate == null
                      ? "Pilih Tanggal"
                      : DateFormat("yyyy-MM-dd").format(selectedDate!),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: saveTransaction,
              child: const Text("Save Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
