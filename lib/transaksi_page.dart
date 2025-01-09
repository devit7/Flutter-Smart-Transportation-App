import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas_akhir/DB/transaksi_api.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({Key? key}) : super(key: key);

  @override
  _TransaksiPageState createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  final TextEditingController idUserController = TextEditingController();
  final TextEditingController idJadwalController = TextEditingController();
  final List<String> statusList = [
    "success",
    "cancel"
  ]; // Nilai status disesuaikan
  final List<String> statusPenumpangList = ["in", "out"];
  String? selectedStatus;
  String? selectedStatusPenumpang;
  DateTime? selectedDate;

  Future<void> saveTransaction() async {
    if (selectedStatus == null ||
        selectedStatusPenumpang == null ||
        selectedDate == null) {
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
        statusPenumpang: selectedStatusPenumpang!,
        tanggalTransaksi: selectedDate!,
      );

      if (response != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Transaction created successfully")),
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
      appBar: AppBar(title: const Text("Transaksi")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: idUserController,
              decoration: const InputDecoration(
                labelText: "ID User",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: idJadwalController,
              decoration: const InputDecoration(
                labelText: "ID Jadwal",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: selectedStatus,
              items: statusList
                  .map((status) => DropdownMenuItem(
                        value: status,
                        child: Text(status),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedStatus = value;
                });
              },
              decoration: const InputDecoration(
                labelText: "Status",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: selectedStatusPenumpang,
              items: statusPenumpangList
                  .map((statusPenumpang) => DropdownMenuItem(
                        value: statusPenumpang,
                        child: Text(statusPenumpang),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedStatusPenumpang = value;
                });
              },
              decoration: const InputDecoration(
                labelText: "Status Penumpang",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: pickDate,
              child: Text(selectedDate == null
                  ? "Pilih Tanggal"
                  : DateFormat("yyyy-MM-dd").format(selectedDate!)),
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
