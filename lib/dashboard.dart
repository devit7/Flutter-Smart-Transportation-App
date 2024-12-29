import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  int _selectedIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Column(
          children: [
            //Profile
            Container(
              padding: EdgeInsets.all(20),
              child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Avatar
                    ClipOval(
                      child:  Image.asset(
                        "assets/images/yelan.jpg",
                        fit: BoxFit.cover,
                        width: 100,)
                    ),
                    //Nickname
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text("Hello",
                            style: TextStyle(
                              fontFamily: 'FigtreeBold',
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,),
                          Text("Yellan Liyue",
                            style: TextStyle(
                              fontFamily: 'FigtreeBold',
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                              textAlign: TextAlign.left,)
                        ],
                      ),
                    ),
                    //IconNotification
                    Container(
                      
                      child: IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.notifications, size: 35,)),
                    )
                  ],
                )
            ),
            //Lokasi
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Icon(Icons.location_on, size: 35,color: Color.fromARGB(255, 223, 37, 96),),
                  Text("Surabaya", 
                  style: TextStyle(
                    fontFamily: 'FigtreeBold',
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),)
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text("Rumah")
                  
                ],
              ),
            )
          ],
        )),
      
      
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
                        onPressed: (){
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
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
                        onPressed: (){
                          setState(() {
                            _selectedIndex = 1;
                          });
                        }, 
                        icon: Icon(Icons.qr_code))
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, bottom: 30),
                    child: SizedBox(
                      width: 120.0,
                      height: 50.0,
                      child: TextButton(
                        onPressed: (){
                          setState(() {
                            _selectedIndex = 2;
                          });
                        },
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