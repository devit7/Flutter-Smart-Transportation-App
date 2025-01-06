import 'package:flutter/material.dart';

class CobaIcon extends StatefulWidget {
  const CobaIcon({super.key});

  @override
  State<CobaIcon> createState() => _CobaIconState();
}

class _CobaIconState extends State<CobaIcon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coba Dulu"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 200,
              height: 60,
              child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_ic_call_rounded),
                        SizedBox(
                          width: 10,
                        ),
                        Text("hai"),
                      ])),
            )
          ],
        ),
      ),
    );
  }
}
