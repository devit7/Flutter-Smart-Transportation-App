import 'package:flutter/material.dart';
import 'package:tugas_akhir/model/bus.dart';

class ListBus extends StatefulWidget {
  const ListBus({super.key});

  @override
  State<ListBus> createState() => _ListBusState();
}

class _ListBusState extends State<ListBus> {

  // Function to show modal
  void showBusDetails(BuildContext context, Bus bus) {
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
              bus.name,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900]),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: bus.status == "Available" ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                bus.status,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kapasitas:",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "${bus.capacity}",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Penumpang saat ini:",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "${bus.currentPassengers}",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "Halte yang dituju:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ...bus.destination.map((stop) => Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(stop["name"] ?? "", style: TextStyle(fontSize: 16)),
                      Text(stop["time"] ?? "", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                )),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
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
            Expanded(
              child: ListView.builder(
                itemCount: busList.length,
                itemBuilder: (context, index) {
                  final bus = busList[index];
                  return GestureDetector(
                    onTap: () => showBusDetails(context, bus),
                    child: Card(
                      elevation: 10.0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2.0),
                                          child: CircleAvatar(
                                            radius: 3.0,
                                            backgroundColor: Colors.grey[400],
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
                                Text(bus.name,
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
                                color: bus.status == "Available"
                                    ? Colors.green
                                    : Colors.red,
                              ),
                              child: Text(
                                bus.status,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
