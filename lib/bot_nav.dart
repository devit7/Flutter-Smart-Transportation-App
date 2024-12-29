import 'package:flutter/material.dart';

class BotNavbar extends StatefulWidget {
  const BotNavbar({super.key});

  @override
  State<BotNavbar> createState() => _BotNavbarState();
}

class _BotNavbarState extends State<BotNavbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: Stack(
          // fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              //alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
              ),
            ),
            Container(
              //alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  color: Color.fromARGB(255, 26, 42, 69),
                ),
              ),
            ),
            Container(
              //alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //BUTTON HOME
                  Container(
                    margin: EdgeInsets.only(bottom: 30, left: 20),
                    child: SizedBox(
                      width: 120.0,
                      height: 50.0,
                      child: TextButton(
                        onPressed: (){},
                        style: TextButton.styleFrom(backgroundColor: Color.fromARGB(255, 68, 87, 118)), 
                        child: Text("Home", style: TextStyle(color: Colors.white),)),
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Color.fromARGB(255, 26, 42, 69), width: 3)
                    ),
                    child: SizedBox(
                      width: 70.0,
                      height: 70.0,
                      child: IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.qr_code))
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, bottom: 30),
                    child: SizedBox(
                      width: 120.0,
                      height: 50.0,
                      child: TextButton(
                        onPressed: (){},
                        style: TextButton.styleFrom(backgroundColor: Color.fromARGB(255, 68, 87, 118)), 
                        child: Text("Profile", style: TextStyle(color: Colors.white),)),
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}