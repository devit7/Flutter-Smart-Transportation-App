import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas_akhir/DB/bus_api.dart';
import 'package:tugas_akhir/model/bus_api_model.dart';

class ListBusApi extends StatefulWidget {
  const ListBusApi({super.key});

  @override
  State<ListBusApi> createState() => _ListBusApiState();
}

class _ListBusApiState extends State<ListBusApi> {
  Future<dynamic>? futureBus;
  final busApi = BusApi();

  @override
  void initState() {
    super.initState();
    getDataBus();
  }

  void getDataBus() {
    setState(() {
      futureBus = busApi.getBus();
    });
  }

  void showBusDetails(BuildContext context, BusApiModel bus) {
    String formatRupiah = NumberFormat.currency(
      locale: 'id', // Locale Indonesia
      symbol: 'Rp', // Simbol Rupiah
      decimalDigits: 0, // Tanda bahwa tidakidak ada angka desimal
    ).format(bus.harga); // Nilai yang ingin diubah menjadi format Rupiah

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bus.namaBus,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900]),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: bus.kapasitasPenumpang != 0 ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              child: bus.kapasitasPenumpang != 0
                  ? Text(
                      "Available",
                      style: TextStyle(color: Colors.white),
                    )
                  : Text(
                      "Unavailable",
                      style: TextStyle(color: Colors.white),
                    ),
            ),
            SizedBox(height: 15),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Kapasitas:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      bus.kapasitasPenumpang.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Biaya",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      formatRupiah, //output: 20000 -> Rp 20.000
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            //start - widget menampilkan penumpang saat ini
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "Penumpang saat ini:",
            //       style: TextStyle(fontSize: 16),
            //     ),
            //     Text(
            //       "bus.currentPassengers",
            //       style: TextStyle(fontSize: 16),
            //     ),
            //   ],
            // ),
            //end - widget menampilkan penumpang saat ini
            SizedBox(height: 5),
            Divider(
              color: Colors.grey,
            ),
            Text(
              "Tujuan:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Nama Halte",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700)),
                      Text(bus.namaHalte, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Lokasi Halte",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700)),
                      Text(bus.lokasiHalte, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      Text(
                        "Waktu Berangkat",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(bus.waktuBerangkat, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Kembali",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Bus'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Column(
          children: [
            // Search bar
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search bus...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // List of buses
            FutureBuilder(
              future: futureBus,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.data == null) {
                  return const Center(child: Text('No Data Found'));
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: busApi.busList.length,
                      itemBuilder: (context, index) {
                        final bus = busApi.busList[index];
                        return GestureDetector(
                          onTap: () => showBusDetails(context, bus),
                          child: Card(
                            elevation: 10.0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 25.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // Titik biru pertama
                                            CircleAvatar(
                                              radius: 7.0,
                                              backgroundColor: Colors.blue[900],
                                              child: CircleAvatar(
                                                radius: 3.0,
                                                backgroundColor: Colors.white,
                                              ),
                                            ),
                                            // Titik abu-abu di tengah
                                            ...List.generate(
                                              4,
                                              (index) => Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 2.0),
                                                child: CircleAvatar(
                                                  radius: 3.0,
                                                  backgroundColor:
                                                      Colors.grey[400],
                                                ),
                                              ),
                                            ),
                                            // Titik biru terakhir
                                            CircleAvatar(
                                              radius: 7.0,
                                              backgroundColor: Colors.blue[900],
                                              child: CircleAvatar(
                                                radius: 3.0,
                                                backgroundColor: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(Icons.directions_bus, size: 40),
                                      SizedBox(width: 10),
                                      Text(bus.namaBus,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 160,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: bus.kapasitasPenumpang != 0
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                    child: bus.kapasitasPenumpang != 0
                                        ? Text(
                                            "Available",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          )
                                        : Text(
                                            "Unavailable",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
