import 'package:flutter/material.dart';

class DetailBus extends StatefulWidget {
  const DetailBus({super.key});

  @override
  State<DetailBus> createState() => _DetailBusState();
}

class _DetailBusState extends State<DetailBus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Bus'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Detail Bus'),
          ],
        ),
      ),
    );
  }
}