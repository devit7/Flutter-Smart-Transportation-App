import 'package:flutter/material.dart';
import 'package:tugas_akhir/DB/transaksi_api.dart';
import 'package:tugas_akhir/transaksi_page.dart';

class KonfirmasiPage extends StatefulWidget {
  final String id;

  const KonfirmasiPage({Key? key, required this.id}) : super(key: key);

  @override
  _KonfirmasiPageState createState() => _KonfirmasiPageState();
}

class _KonfirmasiPageState extends State<KonfirmasiPage> {
  bool isLoading = false;

  Future<void> confirmTransaction() async {
    setState(() {
      isLoading = true;
    });

    try {
      final success = await TransaksiApi().update(
        id: widget.id,
        statusPenumpang: "out",
      );

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Transaction confirmed successfully")),
        );
        Navigator.pop(context); // Kembali ke halaman sebelumnya
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to confirm transaction")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2A45), // Warna AppBar
        title: const Text(
          "Konfirmasi Transaksi",
          style: TextStyle(color: Colors.white), // Warna putih untuk teks
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back, // Panah kembali
            color: Colors.white, // Warna putih untuk ikon
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TransaksiPage()));
          },
        ),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(16.0), // Menambahkan padding
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Apakah Anda yakin ingin mengonfirmasi transaksi ini?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: confirmTransaction,
                      child: const Text("Konfirmasi"),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
