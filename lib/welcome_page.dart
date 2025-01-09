import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tugas_akhir/login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 2), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }
  @override
Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "WELCOME TO",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            SvgPicture.asset(
              'assets/images/logo_busstop.svg',
              width: 200,
            ),
            Image.asset(
              'assets/images/bus.png',
              width: 200,
            )
          ],
        ),
      ),
    );
  }
}
