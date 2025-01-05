// Data dummy bus
class Bus {
  final String name;
  final String status;
  final int capacity;
  final int currentPassengers;
  final List<Map<String, String>> destination;

  Bus({
    required this.name,
    required this.status,
    required this.capacity,
    required this.currentPassengers,
    required this.destination,
  });
}

final List<Bus> busList = [
  Bus(
    name: "Bus 1",
    status: "Full",
    capacity: 20,
    currentPassengers: 20,
    destination: [
      {"name": "Halte Tunjungan", "time": "18:00"},
      {"name": "Halte Balai Pemuda", "time": "19:00"},
      {"name": "Halte Taman Bungkul", "time": "20:00"},
      {"name": "Halte Wonokromo", "time": "21:00"},
    ],
  ),
  Bus(
    name: "Bus 2",
    status: "Available",
    capacity: 20,
    currentPassengers: 15,
    destination: [
      {"name": "Halte Tunjungan", "time": "18:00"},
      {"name": "Halte Balai Pemuda", "time": "19:00"},
      {"name": "Halte Taman Bungkul", "time": "20:00"},
      {"name": "Halte Wonokromo", "time": "21:00"},
    ],
  ),
  // Tambahkan data bus lainnya jika diperlukan
];