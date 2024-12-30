import 'package:flutter/material.dart';

class ListBus extends StatefulWidget {
  const ListBus({super.key});

  @override
  State<ListBus> createState() => _ListBusState();
}

class _ListBusState extends State<ListBus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Bus'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Column(
          spacing: 10,
          children: [
            // search bar
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
            // List of buses
            Card(
                elevation: 10.0,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
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
                          Text('Bus 1',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 160,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 0.2,
                                blurRadius: 1,
                                offset: Offset(0, 1),
                              ),
                            ]),
                        child: Text(
                          'Full Booked',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                )),
            Card(
                elevation: 10.0,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
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
                          Text('Bus 1',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 160,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.yellow,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 0.2,
                                blurRadius: 1,
                                offset: Offset(0, 1),
                              ),
                            ]),
                        child: Text(
                          '2 Left',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                )),
            Card(
                elevation: 10.0,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
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
                          Text('Bus 1',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 160,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 0.2,
                                blurRadius: 1,
                                offset: Offset(0, 1),
                              ),
                            ]),
                        child: Text(
                          'Available',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
