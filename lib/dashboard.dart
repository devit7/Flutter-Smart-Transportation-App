import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
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
    );
  }
}